using System.Collections.Generic;

namespace Split2021.Entities
{
    public class User : Entity
    {
        public User()
            : base("user", "users")
        {}

        public string Email
        {
            get { return Attributes["email"] as string; }
            set { Attributes["email"] = value; }
        }
        public string Lastname
        {
            get { return Attributes["last_name"] as string; }
            set { Attributes["last_name"] = value; }
        }
        public string Firstname
        {
            get { return Attributes["first_name"] as string; }
            set { Attributes["first_name"] = value; }
        }
        public string Phone
        {
            get { return Attributes["phone"] as string; }
            set { Attributes["phone"] = value; }
        }
        public string Username
        {
            get { return Attributes["username"] as string; }
            set { Attributes["username"] = value; }
        }
        public List<long> Friends
        {
            get { return Attributes["friends"] as List<long>; }
            set { Attributes["friends"] = value; }
        }
        public List<long> PaymentMethods
        {
            get { return Attributes["payment_methods"] as List<long>; }
            set { Attributes["payment_methods"] = value; }
        }
        public List<long> Groups
        {
            get { return Attributes["group_set"] as List<long>; }
            set { Attributes["group_set"] = value; }
        }
    }
}
