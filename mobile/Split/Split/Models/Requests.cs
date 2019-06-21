using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Split.Models
{
    public class Requests
    {
        public static async Task<bool> PostLog(string username, string password)
        {
            var request = (HttpWebRequest)WebRequest.Create("https://tiphaine-laurent.fr/api-token-auth");
            request.ContentType = "application/json";
            request.Headers["Authorization"] = "40263bc46470f550a3b40c7e4ad1efff0a16fd1";
            request.Method = "POST";

            using (var streamWriter = new StreamWriter(await request.GetRequestStreamAsync()))
            {
                string json = "{\"username\":\"" + username + "\"," + "\"password\":\"" + password + "\"}";

                await streamWriter.WriteAsync(json);
                await streamWriter.FlushAsync();
                streamWriter.Close();
            }

            try
            {
                var response = (HttpWebResponse)await Task.Factory
      .FromAsync<WebResponse>(request.BeginGetResponse,
                              request.EndGetResponse,
                              null);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                Constants.ErrorMessage = ex.Message;
                return false;
            }
        }
    }
}
