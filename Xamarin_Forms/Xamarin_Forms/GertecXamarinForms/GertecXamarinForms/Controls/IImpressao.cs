using Xamarin.Forms;

namespace GertecXamarinForms.Controls
{
    public interface IImpressao
    {
        string iniLoadModelo();

        void BtnStatusImpressora_Click();

        void BtnImprimirMensagem_Click(string mensagem, string alinhamento, bool btnNegrito, bool btnItalico, bool btnSublinhado, string fonte, int tamanho);

        void BtnImprimirImagem_Click();

        void BtnImprimirBarCode_Click(string mensagem, int height, int width, string barCode);

        void BtnImprimirTodasFunc_Click();

    }
}