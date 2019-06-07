using System;
using System.Collections.Generic;
using System.Text;

namespace Split.Models
{
    public class PhoneContact
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }

        public string Name { get => $"{FirstName} {LastName}"; }

        public bool Selected { get; set; }

        public PhoneContact() { }

        public PhoneContact(string FirstName, string LastName, string PhoneNumber)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.PhoneNumber = PhoneNumber;
        }
    }
}
