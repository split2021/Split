﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Split.Models;

namespace Split.Views.DetailViews
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ContactPage : ContentPage
	{
        public Group NewGroup;
        public string GroupName;
        public PhoneContact Me;
        public List<PhoneContact> GroupPhoneContact;

        public ContactPage ()
		{
			InitializeComponent ();
            Init();
        }

        void Init()
        {
            ContactListView.ItemsSource = Constants.ContactList;
        }

        void CreateGroup(object sender, EventArgs e)
        {
            NewGroup = new Group();
            GroupName = "Group " + (Constants.GroupList.Count + 1).ToString();
            GroupPhoneContact = new List<PhoneContact>();
            Me = new PhoneContact();
            Me.FirstName = "Moi";
            Me.PhoneNumber = "0102030405";
            GroupPhoneContact.Add(Me);
            foreach (var PhoneContact in Constants.ContactList)
            {
                if (PhoneContact.Selected == true)
                {
                    GroupPhoneContact.Add(PhoneContact);
                    PhoneContact.Selected = false;
                }
            }
            if (GroupPhoneContact.Count > 0)
            {
                NewGroup.Name = GroupName;
                NewGroup.phonecontact = GroupPhoneContact;
                NewGroup.SetNamesList();
                Constants.GroupList.Add(NewGroup);
            }
        }
    }
}