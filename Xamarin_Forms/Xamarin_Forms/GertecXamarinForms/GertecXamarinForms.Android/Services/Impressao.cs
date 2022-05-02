using Android.App;
using Android.Content;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Support.V7.App;
using Android.Views;
using Android.Widget;
using Android.OS;
using Android.Runtime;
using GertecXamarinForms.Droid;
using BR.Com.Gertec.Gedi.Exceptions;
using Plugin.DeviceInfo;
using System;
using GertecXamarinForms.Controls;
using Xamarin.Forms;
using GertecXamarinForms.Droid.Impressao;
using GertecXamarinForms.Droid.Services;
using System.Linq;

[assembly: Xamarin.Forms.Dependency(typeof(Impressao))]
namespace GertecXamarinForms.Droid.Services
{
    [Activity(Label = "Impressao")]
    public class Impressao : Activity, IImpressao
    {
        public Context context;
        //public static ConfigPrint configPrint;
        //public static GertecPrinter printer;
        //public static string modelo;

        public Impressao()
        {
            this.context = Android.App.Application.Context;

        }

        protected override void OnCreate(Bundle savedInstanceState)
        {

            base.OnCreate(savedInstanceState);

            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            global::Xamarin.Forms.Forms.Init(this, savedInstanceState);
                        

            // ZXing Inicialização
            global::ZXing.Net.Mobile.Forms.Android.Platform.Init();

        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }

        public string iniLoadModelo()
        {
            if (MainActivity.modelo.Equals("Smart G800"))
            {
                return "Funções Impressão TSG800";
            }
            else
            {
                return "Funções Impressão GPOS700";
            }
        }

        public void BtnStatusImpressora_Click()
        {
            string statusImpressora;

            try
            {
                statusImpressora = MainActivity.printer.getStatusImpressora();
                Toast.MakeText(context, statusImpressora, ToastLength.Long).Show();
            }
            catch (Exception e)
            {
                Toast.MakeText(context, e.Message, ToastLength.Long).Show();
            }
        }

        public void BtnImprimirMensagem_Click(string mensagem, string alinhamento, bool btnNegrito, bool btnItalico, bool btnSublinhado, string fonte, int tamanho)
        {
            if (String.IsNullOrWhiteSpace(mensagem))
            {
                Toast.MakeText(context, "Escreva uma mensagem", ToastLength.Long).Show();
            }
            else if (String.IsNullOrWhiteSpace(alinhamento))
            {
                Toast.MakeText(context, "Selecione um alinhamento", ToastLength.Long).Show();
            }
            else
            {
                try
                {
                    MainActivity.configPrint.Alinhamento = alinhamento;
                    MainActivity.configPrint.Negrito = btnNegrito;
                    MainActivity.configPrint.Italico = btnItalico;
                    MainActivity.configPrint.SubLinhado = btnSublinhado;
                    MainActivity.configPrint.Fonte = fonte;
                    MainActivity.configPrint.Tamanho = tamanho;

                    MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                    MainActivity.printer.ImprimeTexto(mensagem);
                    MainActivity.printer.AvancaLinha(100);
                    MainActivity.printer.ImpressoraOutput();
                }
                catch (GediException e)
                {
                    Toast.MakeText(context, e.Message, ToastLength.Long).Show();
                }
            }
        }

        public void BtnImprimirImagem_Click()
        {
            MainActivity.configPrint.IWidth = 430;
            MainActivity.configPrint.IHeight = 700;
            MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
            MainActivity.printer.ImprimeImagem("invoice");
            MainActivity.configPrint.IWidth = 400;
            MainActivity.configPrint.IHeight = 150;
            MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
            MainActivity.printer.ImprimeImagem("gertec");
            MainActivity.configPrint.IWidth = 300;
            MainActivity.configPrint.IHeight = 400;
            MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
            MainActivity.printer.ImprimeImagem("gertecone");
            MainActivity.printer.AvancaLinha(100);
            MainActivity.printer.ImpressoraOutput();
        }

        public void BtnImprimirBarCode_Click(string mensagem, int height, int width, string tipoCode)
        {
            if (String.IsNullOrWhiteSpace(mensagem))
            {
                Toast.MakeText(context, "Escreva uma mensagem", ToastLength.Long).Show();
            }
            else if (tipoCode.Equals("EAN_8") || tipoCode.Equals("EAN_13"))
            {
                if (mensagem.All(char.IsDigit))
                {
                    if ((tipoCode.Equals("EAN_8") && mensagem.Length == 7) || (tipoCode.Equals("EAN_13") && mensagem.Length == 12))
                    {
                        MainActivity.printer.ImprimeBarCode(
                        mensagem,
                        height,
                        width,
                        tipoCode);
                        MainActivity.printer.AvancaLinha(100);
                        MainActivity.printer.ImpressoraOutput();
                    }
                    else
                    {
                        Toast.MakeText(context, "", ToastLength.Long).Show();
                    }
                }
                else
                {
                    Toast.MakeText(context, "", ToastLength.Long).Show();
                }
            }
            else
            {
                MainActivity.printer.ImprimeBarCode(
                    mensagem,
                    height,
                    width,
                    tipoCode);
                MainActivity.printer.AvancaLinha(100);
                MainActivity.printer.ImpressoraOutput();
            }
        }

        public void BtnImprimirTodasFunc_Click()
        {
            MainActivity.configPrint.Italico = false;
            MainActivity.configPrint.Negrito = true;
            MainActivity.configPrint.Tamanho = 20;
            MainActivity.configPrint.Fonte = "MONOSPACE";
            MainActivity.printer.setConfigImpressao(MainActivity.configPrint);

            try
            {
                MainActivity.printer.getStatusImpressora();
                // Imprimindo imagem
                MainActivity.configPrint.IWidth = 300;
                MainActivity.configPrint.IHeight = 130;
                MainActivity.configPrint.Alinhamento = "CENTER";
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("==[Iniciando Impressao Imagem]==");
                MainActivity.printer.ImprimeImagem("gertec_2");
                MainActivity.printer.AvancaLinha(10);
                MainActivity.printer.ImprimeTexto("====[Fim Impressão Imagem]====");
                MainActivity.printer.AvancaLinha(10);
                // Fim Imagem

                // Impressão Centralizada
                MainActivity.configPrint.Alinhamento = "CENTER";
                MainActivity.configPrint.Tamanho = 30;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("CENTRALIZADO");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Centralizada

                // Impressão Esquerda
                MainActivity.configPrint.Alinhamento = "LEFT";
                MainActivity.configPrint.Tamanho = 40;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("ESQUERDA");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Esquerda

                // Impressão Direita
                MainActivity.configPrint.Alinhamento = "RIGHT";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("DIREITA");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Direita

                // Impressão Negrito
                MainActivity.configPrint.Negrito = true;
                MainActivity.configPrint.Alinhamento = "LEFT";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("=======[Escrita Netrigo]=======");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Negrito

                // Impressão Italico
                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = true;
                MainActivity.configPrint.Alinhamento = "LEFT";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("=======[Escrita Italico]=======");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Italico

                // Impressão Italico
                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = false;
                MainActivity.configPrint.SubLinhado = true;
                MainActivity.configPrint.Alinhamento = "LEFT";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("======[Escrita Sublinhado]=====");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Italico

                // Impressão BarCode 128
                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = false;
                MainActivity.configPrint.SubLinhado = false;
                MainActivity.configPrint.Alinhamento = "CENTER";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("====[Codigo Barras CODE 128]====");
                MainActivity.printer.ImprimeBarCode("12345678901234567890", 120, 120, "CODE_128");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão BarCode 128

                // Impressão Normal
                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = false;
                MainActivity.configPrint.SubLinhado = true;
                MainActivity.configPrint.Alinhamento = "LEFT";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("=======[Escrita Normal]=======");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Normal

                // Impressão Normal
                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = false;
                MainActivity.configPrint.SubLinhado = true;
                MainActivity.configPrint.Alinhamento = "LEFT";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("=========[BlankLine 50]=========");
                MainActivity.printer.AvancaLinha(50);
                MainActivity.printer.ImprimeTexto("=======[Fim BlankLine 50]=======");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão Normal

                // Impressão BarCode 13
                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = false;
                MainActivity.configPrint.SubLinhado = false;
                MainActivity.configPrint.Alinhamento = "CENTER";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("=====[Codigo Barras EAN13]=====");
                MainActivity.printer.ImprimeBarCode("7891234567895", 120, 120, "EAN_13");
                MainActivity.printer.AvancaLinha(10);
                // Fim Impressão BarCode 128

                // Impressão BarCode 13
                MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                MainActivity.printer.ImprimeTexto("===[Codigo QrCode Gertec LIB]==");
                MainActivity.printer.AvancaLinha(10);
                MainActivity.printer.ImprimeBarCode("Gertec Developer Partner LIB", 240, 240, "QR_CODE");

                MainActivity.configPrint.Negrito = false;
                MainActivity.configPrint.Italico = false;
                MainActivity.configPrint.SubLinhado = false;
                MainActivity.configPrint.Alinhamento = "CENTER";
                MainActivity.configPrint.Tamanho = 20;
                MainActivity.printer.ImprimeTexto("===[Codigo QrCode Gertec IMG]==");
                MainActivity.printer.ImprimeBarCodeIMG("Gertec Developer Partner IMG", 240, 240, "QR_CODE");

                MainActivity.printer.AvancaLinha(100);
                // Fim Imagem
            }
            catch (GediException e)
            {
                Toast.MakeText(context, e.Message, ToastLength.Long).Show();
            }
            finally
            {
                try
                {
                    MainActivity.printer.ImpressoraOutput();
                }
                catch (GediException e)
                {
                    Toast.MakeText(context, e.Message, ToastLength.Long).Show();
                }
            }
        }
                
    }
}