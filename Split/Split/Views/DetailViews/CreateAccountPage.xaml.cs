using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Split.Views.DetailViews
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class CreateAccountPage : ContentPage
    {
        public CreateAccountPage()
        {
            InitializeComponent();
        }

        void ReturnMainPage(object sender, EventArgs e)
        {
            Application.Current.MainPage = new LoginPage();
        }
        void CreateAccount(object sender, EventArgs e)
        {
            
        }
    }
}