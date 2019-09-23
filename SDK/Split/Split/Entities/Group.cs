using System;
using System.Collections.Generic;
using System.Text;

namespace Split2021.Entities
{
    class Group : Entity
    {
        public new static readonly string SingleName = "group";
        public new static readonly string CollectionName = "groups";

        public Group()
            : base(SingleName, CollectionName)
        { }
    }
}
