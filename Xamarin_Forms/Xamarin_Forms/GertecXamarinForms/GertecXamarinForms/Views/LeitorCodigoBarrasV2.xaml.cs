using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using ZXing;
using ZXing.Mobile;
using ZXing.Net.Mobile.Forms;

namespace GertecXamarinForms.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LeitorCodigoBarrasV2 : ContentPage
    {
		public event EventHandler<string> BarcodeRead;
		private bool PopUp = false;

		public LeitorCodigoBarrasV2()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

			// Todos os formatos que códigos que serão aceitos
			var zXingOptions = new MobileBarcodeScanningOptions()
			{
				DelayBetweenContinuousScans = 1000,
				AutoRotate = false,
				UseFrontCameraIfAvailable = false,
				PossibleFormats = new List<BarcodeFormat>(new[]
			 {
				BarcodeFormat.AZTEC,
				BarcodeFormat.CODABAR,
				BarcodeFormat.CODE_39,
				BarcodeFormat.CODE_93,
				BarcodeFormat.CODE_128,
				BarcodeFormat.DATA_MATRIX,
				BarcodeFormat.EAN_8,
				BarcodeFormat.EAN_13,
				BarcodeFormat.ITF,
				BarcodeFormat.MAXICODE,
				BarcodeFormat.PDF_417,
				BarcodeFormat.QR_CODE,
				BarcodeFormat.RSS_14,
				BarcodeFormat.RSS_EXPANDED,
				BarcodeFormat.UPC_A,
				BarcodeFormat.UPC_E,
				BarcodeFormat.All_1D,
				BarcodeFormat.UPC_EAN_EXTENSION,
				BarcodeFormat.PLESSEY,
				BarcodeFormat.IMB
			 }),
				//Obtém ou define um sinalizador que causa uma análise mais profunda do bitmap.
				TryHarder = true
			};

			BarcodeScanView.Options = zXingOptions;

		}

		public void Handle_OnScanResult(Result result)
		{
			//pega as informações do código lido e exibe
			Device.BeginInvokeOnMainThread(async () =>
			{
				if (!PopUp) {
					PopUp = true;
					BarcodeRead?.Invoke(this, result.BarcodeFormat + ": " + result.Text);
					btnResult.Text = result.BarcodeFormat + ": " + result.Text;
					await DisplayAlert("Código " + result.BarcodeFormat, result.BarcodeFormat + ": " + result.Text, "OK");
					PopUp = false;
				}
			});
		}
		
		protected override void OnAppearing()
		{
			base.OnAppearing();
			//inicializa a leitura
			BarcodeScanView.IsScanning = true;

		}

		protected override void OnDisappearing()
		{
			//finaliza a leitura
			BarcodeScanView.IsScanning = false;
			base.OnDisappearing();

		}

	}
}
