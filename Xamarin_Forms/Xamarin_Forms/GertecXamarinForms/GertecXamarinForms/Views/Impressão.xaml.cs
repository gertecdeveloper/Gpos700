using GertecXamarinForms.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GertecXamarinForms.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Impressão : ContentPage
    {
        
        public Impressão()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

            //Metodo para exibir o modelo da máquina sendo utilizada no titulo
            //string modelo = DependencyService.Get<IImpressao>().iniLoadModelo();
            //lblVersao.Text = modelo;

            pckFont.Items.Add("DEFAULT");
            pckFont.Items.Add("MONOSPACE");
            pckFont.Items.Add("SANS SERIF");
            pckFont.Items.Add("SERIF");
            pckFont.Items.Add("VECTRA.otf");
            pckFont.SelectedIndex = 0;

            pckSize.Items.Add("20");
            pckSize.Items.Add("30");
            pckSize.Items.Add("40");
            pckSize.Items.Add("50");
            pckSize.Items.Add("60");
            pckSize.Items.Add("70");
            pckSize.Items.Add("80");
            pckSize.Items.Add("90");
            pckSize.Items.Add("100");
            pckSize.SelectedIndex = 4;

            pckBarCodeHeight.Items.Add("10");
            pckBarCodeHeight.Items.Add("40");
            pckBarCodeHeight.Items.Add("80");
            pckBarCodeHeight.Items.Add("120");
            pckBarCodeHeight.Items.Add("160");
            pckBarCodeHeight.Items.Add("200");
            pckBarCodeHeight.Items.Add("240");
            pckBarCodeHeight.Items.Add("280");
            pckBarCodeHeight.Items.Add("320");
            pckBarCodeHeight.Items.Add("380");
            pckBarCodeHeight.SelectedIndex = 7;

            pckBarCodeWidth.Items.Add("10");
            pckBarCodeWidth.Items.Add("40");
            pckBarCodeWidth.Items.Add("80");
            pckBarCodeWidth.Items.Add("120");
            pckBarCodeWidth.Items.Add("160");
            pckBarCodeWidth.Items.Add("200");
            pckBarCodeWidth.Items.Add("240");
            pckBarCodeWidth.Items.Add("280");
            pckBarCodeWidth.Items.Add("320");
            pckBarCodeWidth.Items.Add("380");
            pckBarCodeWidth.SelectedIndex = 7;

            pckBarCodes.Items.Add("QR_CODE");
            pckBarCodes.Items.Add("CODE_128");
            pckBarCodes.Items.Add("EAN_8");
            pckBarCodes.Items.Add("EAN_13");
            pckBarCodes.Items.Add("PDF_417");
            pckBarCodes.SelectedIndex = 0;
        }

        private void btnStatusImpressora(object sender, EventArgs e)
        {
            DependencyService.Get<IImpressao>().BtnStatusImpressora_Click();
        }

        private void btnImprimirTexto(object sender, EventArgs e)
        {
            string texto = MensagemEntry.Text;
            string alinhamento = "";
            bool negrito = BoldToggleButton.IsToggled;
            bool italico = ItalicToggleButton.IsToggled;
            bool sublinhado = SubToggleButton.IsToggled;
            int selected = pckFont.SelectedIndex;
            string fonte = pckFont.Items[selected];
            selected = pckSize.SelectedIndex;
            int tamanho = Int32.Parse(pckSize.Items[selected]);

            if (checkBoxEsquerda.IsChecked)
            {
                alinhamento = "LEFT";
            }
            else if (checkBoxCentralizado.IsChecked)
            {
                alinhamento = "CENTER";
            }
            else if (checkBoxDireita.IsChecked)
            {
                alinhamento = "RIGHT";
            }
            DependencyService.Get<IImpressao>().BtnImprimirMensagem_Click(texto, alinhamento, negrito, italico, sublinhado, fonte, tamanho);
        }

        private void btnImprimirImagem(object sender, EventArgs e)
        {
            DependencyService.Get<IImpressao>().BtnImprimirImagem_Click();
        }

        private void btnImprimirBarcode(object sender, EventArgs e)
        {
            string texto = MensagemEntry.Text;
            int selected = pckBarCodeHeight.SelectedIndex;
            int height = Int32.Parse(pckBarCodeHeight.Items[selected]);
            selected = pckBarCodeWidth.SelectedIndex;
            int width = Int32.Parse(pckBarCodeWidth.Items[selected]);
            selected = pckBarCodes.SelectedIndex;
            string tipoCode = pckBarCodes.Items[selected];
            DependencyService.Get<IImpressao>().BtnImprimirBarCode_Click(texto, height, width, tipoCode);
        }

        private void btnTodasFunc(object sender, EventArgs e)
        {
            DependencyService.Get<IImpressao>().BtnImprimirTodasFunc_Click();
        }


        void checkBoxEsquerdaChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxEsquerda.IsChecked == true)
            {
                checkBoxCentralizado.IsChecked = false;
                checkBoxDireita.IsChecked = false;
                checkBoxEsquerda.IsChecked = true;
            }
        }

        void checkBoxCentralizadoChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxCentralizado.IsChecked == true)
            {
                checkBoxEsquerda.IsChecked = false;
                checkBoxDireita.IsChecked = false;
                checkBoxCentralizado.IsChecked = true;
            }
        }

        void checkBoxDireitaChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxDireita.IsChecked == true)
            {
                checkBoxCentralizado.IsChecked = false;
                checkBoxEsquerda.IsChecked = false;
                checkBoxDireita.IsChecked = true;
            }
        }

    }

}