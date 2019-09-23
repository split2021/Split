using Split.Views;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

// App Center dependencies (Check App Tool)
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
//

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]
namespace Split
{
    public partial class App : Application
    {
        public App()
        {
            Analytics.TrackEvent("App Launched"); //Send info to App Center

            InitializeComponent();

            MainPage = new LoginPage();
        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}
