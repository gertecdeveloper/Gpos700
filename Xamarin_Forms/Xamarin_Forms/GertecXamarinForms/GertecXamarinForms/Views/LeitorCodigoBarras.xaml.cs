using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GertecXamarinForms.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LeitorCodigoBarras : ContentPage
    {
        public ObservableCollection<string> resultadosBarCod = new ObservableCollection<string>();
        
        public LeitorCodigoBarras()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

            Ean8.Clicked += (sender, e) =>
            {
                Navegacao("EAN_8");
            };

            Ean13.Clicked += (sender, e) =>
            {
                Navegacao("EAN_13");
            };

            Ean14.Clicked += (sender, e) =>
            {
                Navegacao("EAN_14");
            };

            Qrcode.Clicked += (sender, e) =>
            {
                Navegacao("QR_CODE");
            };
        }

        async void Navegacao(string barCode)
        {
            TelaCodigoBarras zView = new TelaCodigoBarras(barCode);
            zView.BarcodeRead += Resultado_Barcode;
            await Navigation.PushModalAsync(zView);
        }

        void Resultado_Barcode(object sender, string e)
        {
            resultadosBarCod.Add(e);
            ListResultadosBarCod.ItemsSource = this.resultadosBarCod;
        }

    }
}
