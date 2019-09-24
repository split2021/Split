using System.Net;

namespace Split2021
{
    class Response
    {
        public HttpStatusCode statuscode = HttpStatusCode.BadRequest;
        public string reason = null;
        public dynamic data = null;
    }
}
