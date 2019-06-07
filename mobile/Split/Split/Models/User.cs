using System;
using System.Collections.Generic;
using System.Text;

namespace Split.Models
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public Token Token = new Token();
        public User() { }
        public User(string Username, string Password)
        {
            this.Username = Username;
            this.Password = Password;
        }
    }
}
