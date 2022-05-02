using Xamarin.Forms;

namespace GertecXamarinForms.Controls
{
    public interface ITef
    {
        void executeSTefVenda(string ip, int valor, string pagamento, int parcelas, string parcelamento, bool impressao);
        void executeGer7Venda(int valor, int parcelas, string pagamento, string parcelamento, bool impressao);
        void executeGer7Cancelamento(bool impressao);
        void executeSTefCancelamento(string ip, int valor, bool impressao);
        void executeGer7Funcoes(bool impressao);
        void executeSTefFuncoes(string ip, int valor, bool impressao);
        void execulteGer7Reimpressao(bool impressao);
        void execulteSTefReimpressao(string ip, int valor, bool impressao);
        bool validaIp(string ipserver);
    }
}