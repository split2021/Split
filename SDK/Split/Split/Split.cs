using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
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
        private bool _autoRefresh = true;

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

        public async Task<HttpResponseMessage> CreateRecord(string entityType, object data)
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
                Content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json"),
                RequestUri = new Uri($"{Constants.APIBaseURI}/{entityType}/"),
                Method = HttpMethod.Post,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            return await client.SendAsync(request);
        }

        public async Task<HttpResponseMessage> DeleteRecord(string entityType, int entityId)
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
                RequestUri = new Uri($"{Constants.APIBaseURI}/{entityType}/{entityId}"),
                Method = HttpMethod.Delete,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            return await client.SendAsync(request);
        }

        public async Task<HttpResponseMessage> RetrieveRecord(string entityType, int entityId)
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
                RequestUri = new Uri($"{Constants.APIBaseURI}/{entityType}/{entityId}"),
                Method = HttpMethod.Get,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            return await client.SendAsync(request);
        }

        public async Task<HttpResponseMessage> RetrieveMultipleRecords(string entityType)
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
                RequestUri = new Uri($"{Constants.APIBaseURI}/{entityType}s/"),
                Method = HttpMethod.Get,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            return await client.SendAsync(request);
        }

        public async Task<HttpResponseMessage> UpdateRecord(string entityType, int entityId, object data)
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
                Content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json"),
                RequestUri = new Uri($"{Constants.APIBaseURI}/{entityType}/{entityId}"),
                Method = new HttpMethod("PATCH"),
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            return await client.SendAsync(request);
        }

        public async Task<HttpResponseMessage> EmplaceRecord(string entityType, int entityId, object data)
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
                Content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json"),
                RequestUri = new Uri($"{Constants.APIBaseURI}/{entityType}/{entityId}"),
                Method = HttpMethod.Put,
                Headers =
                {
                    { HttpRequestHeader.Authorization.ToString(), _token.ToString() }
                }
            };

            return await client.SendAsync(request);
        }
    }
}
