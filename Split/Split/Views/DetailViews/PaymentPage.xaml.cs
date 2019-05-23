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
    public partial class PaymentPage : ContentPage
    {
        public PaymentPage(Group SelectedGroup)
        {
            InitializeComponent();
            Init(SelectedGroup);
        }

        void Init(Group SelectedGroup)
        {
            PaymentListView.ItemsSource = SelectedGroup.NamesList;
        }

        //private void SliderValueChanged(object sender, ValueChangedEventArgs e)
        //{
        //    SliderValue.Text = SliderBar.Value + "€";
        //}

        async void PaymentProcedure(object sender, EventArgs e)
        {
            await DisplayAlert("Information", "Paiement effectué", "Ok");
        }
    }
}