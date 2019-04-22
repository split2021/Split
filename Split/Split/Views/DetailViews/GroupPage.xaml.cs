using System;
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
	public partial class GroupPage : ContentPage
	{
		public GroupPage ()
		{
			InitializeComponent ();
            Init();
		}

        void Init()
        {
            GroupListView.ItemsSource = Constants.GroupList;
            GroupListView.ItemSelected += OnItemSelected;
        }

        async void OnItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            var SelectedGroup = e.SelectedItem as Group;
            if (e != null)
            {
                await Navigation.PushAsync(new PaymentPage(SelectedGroup));
            }
        }
    }
}