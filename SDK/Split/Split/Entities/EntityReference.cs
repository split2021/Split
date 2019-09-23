namespace Split2021.Entities
{
    public class EntityReference : Entity
    {
        public EntityReference(string name)
            : base(name)
        { }

        public EntityReference(string name, string collectionName)
            : base(name, collectionName)
        { }

        public EntityReference(Entity entity)
            : this(entity.singleName, entity.collectionName, entity.Id)
        { }

        public EntityReference(string name, string collectionName, long id)
            : base(name, collectionName)
        {
            Attributes["id"] = id;
        }
    }
}
