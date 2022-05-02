using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using Xamarin.Forms;
using Xamarin.Forms.Internals;
using GertecXamarinForms.Controls;

namespace GertecXamarinForms.Views
{

    [DesignTimeVisible(false)]
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);
        }

        private void codiBarras(object sender, EventArgs e)
        {
            Navigation.PushAsync(new LeitorCodigoBarras());
        }

        private void codiBarrasV2(object sender, EventArgs e)
        {
            Navigation.PushAsync(new LeitorCodigoBarrasV2());
        }

        private void imprimir(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Impressão());
        }

        private void nfcGedi(object sender, EventArgs e)
        {
            DependencyService.Get<INfcGedi>().NfcGedi();
        }
        private void nfcId(object sender, EventArgs e)
        {
            DependencyService.Get<INfcId>().NfcID();
        }
        private void tef(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Tef());            
        }
        private void sat(object sender, EventArgs e)
        {
            Navigation.PushAsync(new MenuSat());
            //System.Console.WriteLine("Teste seleção Sat");            
        }
    }
}
