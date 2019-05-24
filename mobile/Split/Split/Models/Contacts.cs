#if __ANDROID__
using Android.Provider;
#endif
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
            {
#if __ANDROID__
                Constants.ContactList = GetAndroidContacts();
#endif
            }
            else if (Device.RuntimePlatform.Equals("iOS"))
            {
                
            }
        }
#if __ANDROID__
        public static List<PhoneContact> GetAndroidContacts()
        {
            var phoneContacts = new List<PhoneContact>();

            using (var phones = Android.App.Application.Context.ContentResolver.Query(ContactsContract.CommonDataKinds.Phone.ContentUri, null, null, null, null))
            {
                if (phones != null)
                {
                    while (phones.MoveToNext())
                    {
                        try
                        {
                            string name = phones.GetString(phones.GetColumnIndex(ContactsContract.Contacts.InterfaceConsts.DisplayName));
                            string phoneNumber = phones.GetString(phones.GetColumnIndex(ContactsContract.CommonDataKinds.Phone.Number));

                            string[] words = name.Split(' ');
                            var contact = new PhoneContact();
                            contact.FirstName = words[0];
                            if (words.Length > 1)
                                contact.LastName = words[1];
                            else
                                contact.LastName = ""; //no last name
                            contact.PhoneNumber = phoneNumber;
                            contact.Selected = false;
                            phoneContacts.Add(contact);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex);
                        }
                    }
                    phones.Close();
                }
                // if we get here, we can't access the contacts. Consider throwing an exception to display to the user
            }
            return phoneContacts;
        }
#endif
    }
}
