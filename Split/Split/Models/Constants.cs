using System;
using System.Collections.Generic;
using System.Text;

using Xamarin.Forms;

namespace Split.Models
{
    public class Constants
    {
        public static bool IsDev = true;

        public static Color BackGroundColorLoginPage = Color.FromRgb(34, 49, 78);
        public static Color BackGroundColorPage = Color.FromRgb(249, 244, 226);
        public static Color MainTextColor = Color.White;

        public static int LoginIconHeight = 120;

        public static User User = new User();

        public static string ErrorMessage = System.String.Empty;

        public static List<Group> GroupList = new List<Group>();
    }
}
