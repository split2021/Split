using Split.Views.DetailViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Split.Models;

namespace Split.Views.Menu
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class MasterPage : ContentPage
	{
        public ListView Listview { get { return ListView; } }
        public List<MasterMenuItem> items;

        public MasterPage ()
		{
			InitializeComponent();
            SetItem();
		}

        void SetItem()
        {
            items = new List<MasterMenuItem>();
            items.Add(new MasterMenuItem("Groupes", "icon_group.png", Color.White, typeof(GroupPage)));
            items.Add(new MasterMenuItem("Contacts", "icon_contact.png", Color.White, typeof(ContactPage)));
            ListView.ItemsSource = items;
        }

        async void LogOutProcedure(object sender, EventArgs e)
        {
            if (Device.RuntimePlatform.Equals("Android"))
            {
                Application.Current.MainPage = new LoginPage();
            }
            else if (Device.RuntimePlatform.Equals("iOS"))
            {
                await Navigation.PushModalAsync(new LoginPage());
            }
        }
	}
}