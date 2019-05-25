using System;
using System.Collections.Generic;
using System.Text;

namespace Split.Models
{
    public class Token
    {
        public string AcessToken { get; set; }
        public DateTime ExpireDate { get; set; }
        public Token () { }
    }
}
