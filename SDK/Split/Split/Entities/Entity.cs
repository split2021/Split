using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace Split2021.Entities
{
    public class AttributesCollection : Dictionary<string, object>
    {}

    public class EntityConverter : JsonConverter<Entity>
    {
        public override void WriteJson(JsonWriter writer, Entity value, JsonSerializer serializer)
        {
            serializer.Serialize(writer, value.Attributes);
        }

        public override Entity ReadJson(JsonReader reader, Type objectType, Entity existingValue, bool hasExistingValue, JsonSerializer serializer)
        {
            dynamic entity = Activator.CreateInstance(objectType);

            entity.Attributes = JToken.Load(reader).ToObject<Dictionary<string, object>>();
            return entity;
        }
    }

    public class Entity
    {
        public static readonly string SingleName;
        public static readonly string CollectionName;

        public string singleName { get; private set; }
        public string collectionName { get; private set; }

        public AttributesCollection Attributes = new AttributesCollection{ { "id", Constants.InvalidId } };

        public Entity()
            : this("")
        {
        }

        public Entity(string name)
            : this(name, name + "s")
        { }

        public Entity(string name, string collection)
        {
            singleName = name;
            collectionName = collection;
        }

        public override string ToString()
        {
            var stringBuilder = new StringBuilder("Entity  ");
            foreach (var attribute in Attributes)
            {
                stringBuilder.Append(attribute.Key);
                stringBuilder.Append(": ");
                stringBuilder.Append(attribute.Value);
                stringBuilder.Append(", ");
            }
            stringBuilder.Length -= 2;
            return stringBuilder.ToString();
        }

        public long Id {
            get { return (long)Attributes["id"]; }
            set { Attributes["id"] = value; }
        }

        public EntityReference ToEntityReference()
        {
            return new EntityReference(this);
        }

    }

}
