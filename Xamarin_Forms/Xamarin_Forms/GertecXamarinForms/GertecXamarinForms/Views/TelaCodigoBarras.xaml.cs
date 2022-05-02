using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using ZXing.Mobile;
using ZXing.Net.Mobile.Forms;

namespace GertecXamarinForms.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class TelaCodigoBarras : ContentPage
    {
        ZXingScannerView zXing;
        ZXingDefaultOverlay overlay;
        MobileBarcodeScanningOptions optionsEan8, optionsEan13, optionsEan14, optionsQrCode;
        public event EventHandler<string> BarcodeRead;
        public string barCodeButton;
        public string barCodeString;

        public TelaCodigoBarras(string op)
        {
            /*MobileBarcodeScanningOptions optionCode = this.optionCode;*/
           
            InitializeComponent();

            // Configuração da Leitura
            this.optionsEan8 = new MobileBarcodeScanningOptions
            {
                AutoRotate = false,
                UseFrontCameraIfAvailable = false,
                TryHarder = true,
                // Todos os formatos que códigos que serão aceitos
                PossibleFormats = new List<ZXing.BarcodeFormat> {
                    ZXing.BarcodeFormat.EAN_8
                }
            };

            this.optionsEan13 = new MobileBarcodeScanningOptions
            {
                AutoRotate = false,
                UseFrontCameraIfAvailable = false,
                TryHarder = true,
                // Todos os formatos que códigos que serão aceitos
                PossibleFormats = new List<ZXing.BarcodeFormat> {
                    ZXing.BarcodeFormat.EAN_13
                }
            };

            this.optionsEan14 = new MobileBarcodeScanningOptions
            {
                AutoRotate = false,
                UseFrontCameraIfAvailable = false,
                TryHarder = true,
                // Todos os formatos que códigos que serão aceitos
                PossibleFormats = new List<ZXing.BarcodeFormat> {
                    ZXing.BarcodeFormat.EAN_8,
                    ZXing.BarcodeFormat.CODE_128
                }
            };

            this.optionsQrCode = new MobileBarcodeScanningOptions
            {
                AutoRotate = false,
                UseFrontCameraIfAvailable = false,
                TryHarder = true,
                // Todos os formatos que códigos que serão aceitos
                PossibleFormats = new List<ZXing.BarcodeFormat> {
                    ZXing.BarcodeFormat.QR_CODE
                }
            };

            switch (op)
            {
                case "EAN_8":
                    barCodeButton = op;
                    zXing = new ZXingScannerView
                    {
                        HorizontalOptions = LayoutOptions.FillAndExpand,
                        VerticalOptions = LayoutOptions.FillAndExpand,
                        Options = optionsEan8
                    };
                    break;
                case "EAN_13":
                    barCodeButton = op;
                    zXing = new ZXingScannerView
                    {
                        HorizontalOptions = LayoutOptions.FillAndExpand,
                        VerticalOptions = LayoutOptions.FillAndExpand,
                        Options = optionsEan13
                    };
                    break;
                case "EAN_14":
                    barCodeButton = op;
                    zXing = new ZXingScannerView
                    {
                        HorizontalOptions = LayoutOptions.FillAndExpand,
                        VerticalOptions = LayoutOptions.FillAndExpand,
                        Options = optionsEan14
                    };
                    break;
                case "QR_CODE":
                    barCodeButton = op;
                    zXing = new ZXingScannerView
                    {
                        HorizontalOptions = LayoutOptions.FillAndExpand,
                        VerticalOptions = LayoutOptions.FillAndExpand,
                        Options = optionsQrCode
                    };
                    break;
            }

            zXing.OnScanResult += (result) =>
            Device.BeginInvokeOnMainThread(async () =>
            {
                // Finaliza a leitura
                zXing.IsAnalyzing = false;

                barCodeString = result.Text;
                // Pega as informações do código lido
                BarcodeRead?.Invoke(this, barCodeButton + ": " + barCodeString);
                await Navigation.PopModalAsync();
            });

            overlay = new ZXingDefaultOverlay
            {
                TopText = "Aproxime do código para leitura",
                BottomText = "O código será lido automaticamente",
                ShowFlashButton = zXing.HasTorch
            };

            var grid = new Grid
            {
                VerticalOptions = LayoutOptions.FillAndExpand,
                HorizontalOptions = LayoutOptions.FillAndExpand
            };

            grid.Children.Add(zXing);
            grid.Children.Add(overlay);

            Content = grid;
        }

        protected override void OnAppearing()
        {
            barCodeString = "";
            base.OnAppearing();
            zXing.IsScanning = true;
        }

        protected override void OnDisappearing()
        {
            if(barCodeString == "") {
                BarcodeRead?.Invoke(this, barCodeButton + ": Não foi possível ler o código.");
            }
            zXing.IsScanning = false;
            base.OnDisappearing();
        }
    }
}
