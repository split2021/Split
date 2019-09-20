using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Split2021.Entities;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Split2021
{
    public class Split
    {
        private bool _connected = false;
        private Token _token = null;
        private DateTime _lastConnected = new DateTime();
        private string _email = null;
        private string _password = null;
        private readonly bool _autoRefresh = true;

        private static readonly HttpClient client = new HttpClient();

        public Split(bool autoRefresh = true)
        {
            _autoRefresh = autoRefresh;
        }

        public async Task<bool> Connect(string email, string password, bool remember = true)
        {
            var response = await client.PostAsync(Constants.AuthentificationEndpoint, new StringContent($"{{\"email\":\"{email}\",\"password\":\"{password}\"}}", Encoding.UTF8, "application/json"));
            var stringResponse = await response.Content.ReadAsStringAsync();

            var jsonResponse = JObject.Parse(stringResponse);

            if (response.StatusCode == HttpStatusCode.OK)
            {
                if (remember)
                {
                    _email = email;
                    _password = password;
                }
                _token = new Token(jsonResponse.SelectToken("data").Value<string>("token"));
                _connected = true;
                _lastConnected = DateTime.Now;
            }

            return _connected;
        }

        public bool IsConnected()
        {
            return _connected || DateTime.Now.Subtract(_lastConnected).TotalSeconds < 3600;
        }

        public async Task<T> CreateRecord<T>(T entity)
            where T : Entity, new()
        {
            if (!IsConnected())
            {
                if (_autoRefresh)
                {
                    await Connect(_email, _password);
                }
                else
                {
                    return null;
                }
            }

            var request = new HttpRequestMessage()
            {
                Content = new StringContent(JsonConvert.SerializeObject(entity, new EntityConverter()), Encoding.UTF8, "application/json"),
                RequestUri = new Uri($"{Constants.APIBaseURI}/{typeof(T).BaseType.GetProperty("collectionName").GetValue(null)}/"),
                Method = HttpMethod.Post,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            var response = await client.SendAsync(request);
            var stringResponse = await response.Content.ReadAsStringAsync();
            var jsonResponse = JObject.Parse(stringResponse);
            return new T() { Attributes = jsonResponse.GetValue("data").ToObject<AttributesCollection>() };
        }

        public async Task<T> DeleteRecord<T>(int entityId)
            where T : Entity, new()
        {
            if (!IsConnected())
            {
                if (_autoRefresh)
                {
                    await Connect(_email, _password);
                }
                else
                {
                    return null;
                }
            }

            var request = new HttpRequestMessage()
            {
                RequestUri = new Uri($"{Constants.APIBaseURI}/{typeof(T).BaseType.GetProperty("collectionName").GetValue(null)}/{entityId}"),
                Method = HttpMethod.Delete,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            var response = await client.SendAsync(request);
            var stringResponse = await response.Content.ReadAsStringAsync();
            var jsonResponse = JObject.Parse(stringResponse);
            return new T() { Attributes = jsonResponse.GetValue("data").ToObject<AttributesCollection>() };
        }

        public async Task<T> RetrieveRecord<T>(int entityId)
            where T : Entity, new()
        {
            if (!IsConnected())
            {
                if (_autoRefresh)
                {
                    await Connect(_email, _password);
                }
                else
                {
                    return null;
                }
            }

            var request = new HttpRequestMessage()
            {
                RequestUri = new Uri($"{Constants.APIBaseURI}/{typeof(T).BaseType.GetProperty("collectionName").GetValue(null)}/{entityId}"),
                Method = HttpMethod.Get,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            var response = await client.SendAsync(request);
            var stringResponse = await response.Content.ReadAsStringAsync();
            var jsonResponse = JObject.Parse(stringResponse);
            return new T() { Attributes = jsonResponse.GetValue("data").ToObject<AttributesCollection>() };
        }

        public async Task<List<T>> RetrieveMultipleRecords<T>()
            where T : Entity, new()
        {
            if (!IsConnected())
            {
                if (_autoRefresh)
                {
                    await Connect(_email, _password);
                }
                else
                {
                    return null;
                }
            }

            var request = new HttpRequestMessage()
            {
                RequestUri = new Uri($"{Constants.APIBaseURI}/{typeof(T).BaseType.GetProperty("collectionName").GetValue(null)}/"),
                Method = HttpMethod.Get,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            var response = await client.SendAsync(request);
            var stringResponse = await response.Content.ReadAsStringAsync();
            var jsonResponse = JsonConvert.DeserializeObject<Response>(stringResponse);
            var list = jsonResponse.data.ToObject<List<AttributesCollection>>() as List<AttributesCollection>;
            return list.ConvertAll(attributes => new T { Attributes = attributes });
        }

        public async Task<T> UpdateRecord<T>(T entity)
            where T : Entity, new()
        {
            if (!IsConnected())
            {
                if (_autoRefresh)
                {
                    await Connect(_email, _password);
                }
                else
                {
                    return null;
                }
            }

            var request = new HttpRequestMessage()
            {
                Content = new StringContent(JsonConvert.SerializeObject(entity, new EntityConverter()), Encoding.UTF8, "application/json"),
                RequestUri = new Uri($"{Constants.APIBaseURI}/{typeof(T).BaseType.GetProperty("collectionName").GetValue(null)}/{entity.Id}"),
                Method = new HttpMethod("PATCH"),
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            var response = await client.SendAsync(request);
            var stringResponse = await response.Content.ReadAsStringAsync();
            var jsonResponse = JObject.Parse(stringResponse);
            return new T() { Attributes = jsonResponse.GetValue("data").ToObject<AttributesCollection>() };
        }

        public async Task<T> EmplaceRecord<T>(T entity)
            where T : Entity, new()
        {
            if (!IsConnected())
            {
                if (_autoRefresh)
                {
                    await Connect(_email, _password);
                }
                else
                {
                    return null;
                }
            }

            var request = new HttpRequestMessage()
            {
                Content = new StringContent(JsonConvert.SerializeObject(entity, new EntityConverter()), Encoding.UTF8, "application/json"),
                RequestUri = new Uri($"{Constants.APIBaseURI}/{typeof(T).BaseType.GetProperty("collectionName").GetValue(null)}/{entity.Id}"),
                Method = HttpMethod.Put,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            var response = await client.SendAsync(request);
            var stringResponse = await response.Content.ReadAsStringAsync();
            var jsonResponse = JObject.Parse(stringResponse);
            return new T() { Attributes = jsonResponse.GetValue("data").ToObject<AttributesCollection>() };
        }
    }
}
