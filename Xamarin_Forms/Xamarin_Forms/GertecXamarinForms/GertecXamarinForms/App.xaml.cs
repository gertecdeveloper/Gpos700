using GertecXamarinForms.Views;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
 
namespace GertecXamarinForms
{
    public partial class App : Application
    {
        public App()
        {
            //Device.SetFlags(new string[] { "RadioButton_Experimental" });
            InitializeComponent();
            //Device.SetFlags(new string[] { "RadioButton_Experimental" });
            
            MainPage = new NavigationPage(new MainPage());
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
