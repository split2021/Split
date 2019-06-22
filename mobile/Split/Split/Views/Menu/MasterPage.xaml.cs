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

        public MasterPage ()
		{
			InitializeComponent();
		}

        async void GroupsPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new GroupPage());
        }

        async void ContactPage(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new ContactPage());
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