using System.Collections.Generic;

namespace Split2021.Entities
{
    public class User : Entity
    {
        public new static readonly string entityName = "user";
        public new static readonly string collectionName = "users";

        public string email = null;
        public string last_name = null;
        public string first_name = null;
        public string phone = null;
        public string isername = null;
        public List<User> friends = null;
        public List<object> payment_methods = null;
        public List<object> groups = null;
    }
}
