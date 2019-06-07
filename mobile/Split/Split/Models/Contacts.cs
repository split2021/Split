using Split.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace Split.Models
{
    public static class UserContacts
    {
        public static void UpdatePhoneContact()
        {
            if (Device.RuntimePlatform.Equals("Android"))
            {}
            else if (Device.RuntimePlatform.Equals("iOS"))
            {}
        }
    }
}
