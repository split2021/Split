using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Split.Models;
using Split.Views.Menu;
using Split.Views.DetailViews;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Split.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage
    {
        public static NavigationPage NavPage;

        public LoginPage()
        {
            InitializeComponent();
            Init();
        }

        void Init()
        {
            BackgroundColor = Constants.BackGroundColorLoginPage;
            ActivitySpinner.IsVisible = false;
            LoginIcon.HeightRequest = Constants.LoginIconHeight;
            UserContacts.UpdatePhoneContact();

            Entry_Username.Completed += (s, e) => Entry_Password.Focus();
            Entry_Password.Completed += (s, e) => SingInProcedure(s, e);
        }

        async void SingInProcedure(object sender, EventArgs e)
        {
            ActivitySpinner.IsVisible = true;
            bool IsLogged = await Requests.PostLog(Entry_Username.Text, Entry_Password.Text);
            if (IsLogged)
            {
                ActivitySpinner.IsVisible = false;
                Constants.User.Username = Entry_Username.Text;
                Constants.User.Password = Entry_Password.Text;
                if (Device.RuntimePlatform.Equals("Android"))
                {
                    Application.Current.MainPage = new NavigationPage(new MasterDetail());
                }
                else if (Device.RuntimePlatform.Equals("iOS"))
                {
                    await Navigation.PushModalAsync(new NavigationPage(new MasterDetail()));
                }
            }
            else
            {
                ActivitySpinner.IsVisible = false;
                await DisplayAlert("Error", Constants.ErrorMessage, "Ok");
            }
        }

        void CreateAccount(object sender, EventArgs e)
        {
            Application.Current.MainPage = new CreateAccountPage();
        }
    }
}