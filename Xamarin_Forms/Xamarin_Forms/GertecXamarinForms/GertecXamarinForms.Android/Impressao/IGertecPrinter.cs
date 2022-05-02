using System;
using Xamarin.Forms;

namespace GertecXamarinForms.Droid.Impressao
{
    interface IGertecPrinter
    {
        void setConfigImpressao(ConfigPrint config);
        String getStatusImpressora();
        void ImpressoraOutput();
        void ImprimeTexto(String texto);
        void ImprimeTexto(String texto, int tamanho);
        void ImprimeTexto(String texto, bool negrito);
        void ImprimeTexto(String texto, bool negrito, bool italico);
        void ImprimeTexto(String texto, bool negrito, bool italico, bool sublinhado);
        bool sPrintLine(String texto);
        bool ImprimeImagem(String imagem);
        bool ImprimeBarCode(String texto, int height, int width, string barcodeFormat);
        bool ImprimeBarCodeIMG(String texto, int height, int width, String barCodeType);
        void AvancaLinha(int linhas);
        bool IsImpressoraOK();
    }
}