using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Split.Models
{
    public class Group
    {
        public string Name { get; set; }
        public string NamesString { get; set; }
        public List<string> NamesList { get; set; }

        public List<PhoneContact> phonecontact { get; set; }

        public void SetNamesList()
        {
            NamesList = phonecontact.Select(o => o.Name).ToList();
            NamesString = String.Join(", ", NamesList.ToArray());
        }
    }
}
