using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Linq;

namespace Split2021.Entities
{
    public class User : Entity
    {
        public new static readonly string SingleName = "user";
        public new static readonly string CollectionName = "users";

        public User()
            : base(SingleName, CollectionName)
        { }

        public string Email
        {
            get => Attributes["email"] as string;
            set => Attributes["email"] = value;
        }
        public string Lastname
        {
            get => Attributes["last_name"] as string;
            set => Attributes["last_name"] = value;
        }
        public string Firstname
        {
            get => Attributes["first_name"] as string;
            set => Attributes["first_name"] = value;
        }
        public string Phone
        {
            get => Attributes["phone"] as string;
            set => Attributes["phone"] = value;
        }
        public string Username
        {
            get => Attributes["username"] as string;
            set => Attributes["username"] = value;
        }
        public List<EntityReference> Friends
        {
            get
            {
                if (Attributes["friends"] is JArray)
                {
                    Attributes["friends"] = (Attributes["friends"] as JArray).ToList().ConvertAll(friend => new EntityReference(User.SingleName, User.CollectionName, (friend as JToken).Value<long>("id")));
                }
                return Attributes["friends"] as List<EntityReference>;
            }
            set => Attributes["friends"] = value;
        }
        public List<EntityReference> PaymentMethods
        {
            get
            {
                if (Attributes["payment_methods"] is JArray)
                {
                    Attributes["payment_methods"] = (Attributes["payment_methods"] as JArray).ToList().ConvertAll(friend => new EntityReference(PaymentMethod.SingleName, PaymentMethod.CollectionName, (friend as JToken).Value<long>("id")));
                }
                return Attributes["payment_methods"] as List<EntityReference>;
            }
            set => Attributes["payment_methods"] = value;
        }
        public List<EntityReference> Groups
        {
            get
            {
                if (Attributes["group_set"] is JArray)
                {
                    Attributes["group_set"] = (Attributes["group_set"] as JArray).ToList().ConvertAll(friend => new EntityReference(Group.SingleName, Group.CollectionName, (friend as JToken).Value<long>("id")));
                }
                return Attributes["group_set"] as List<EntityReference>;
            }
            set => Attributes["group_set"] = value;
        }
    }
}
