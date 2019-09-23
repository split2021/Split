using System;
using System.Collections.Generic;
using System.Linq;
//App Center Library
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
// UI Test library
using Foundation;
using UIKit;

namespace Split.iOS
{
    // The UIApplicationDelegate for the application. This class is responsible for launching the 
    // User Interface of the application, as well as listening (and optionally responding) to 
    // application events from iOS.
    [Register("AppDelegate")]
    public partial class AppDelegate : global::Xamarin.Forms.Platform.iOS.FormsApplicationDelegate
    {
        //
        // This method is invoked when the application has loaded and is ready to run. In this 
        // method you should instantiate the window, load the UI into it and then make the window
        // visible.
        //
        // You have 17 seconds to return from this method, or iOS will terminate your application.
        //
        public override bool FinishedLaunching(UIApplication app, NSDictionary options)
        {
            //AppCenter addr to send datas
            AppCenter.Start("f5acdb1a-0fa3-460d-a102-e1ea80185cca",
                   typeof(Analytics), typeof(Crashes));
            //UI test part
            #if ENABLE_TEST_CLOUD
            Xamarin.Calabash.Start();
            #endif

            global::Xamarin.Forms.Forms.Init();

            LoadApplication(new App());

            return base.FinishedLaunching(app, options);
        }
    }
}

