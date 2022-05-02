using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Java.Lang;
using Android.Widget;
using GertecXamarinForms.Controls.Sat;
using GertecXamarinForms.Droid.Sat;
using GertecXamarinForms.Droid.SAT;
using GertecXamarinForms.Droid.SAT.ServiceSat;
using Android.Text;

[assembly: Xamarin.Forms.Dependency(typeof(Teste))]
namespace GertecXamarinForms.Droid.SAT
{
    [Activity(Label = "Teste")]
    public class Teste : Activity, ISatTestes
    {
        public static string ultimaChaveVenda;
        private AlertDialog alerta;
        private string codigoSessao;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
        }

        public void cancelarVenda(string codAtivacao, string dadosVenda)
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.mContext);
            builder.SetTitle("Atenção");
            builder.SetMessage("Digite a chave de cancelamento");

            EditText inputChaveCancelamento = new EditText(MainActivity.mContext);
            inputChaveCancelamento.Text = GlobalValues.ultimaChaveVenda;
            builder.SetView(inputChaveCancelamento);
            builder.SetNeutralButton("OK", OkAction);

            void OkAction(object sender, DialogClickEventArgs e)
            {
                ultimaChaveVenda = inputChaveCancelamento.Text;
                var codigoAtivacao = codAtivacao.ToString();

                if (!SatUtils.VerificaCodigoAtivacao(codigoAtivacao))
                {
                    SatUtils.MostrarToast(MainActivity.mContext, "Código de Ativação deve ter entre 8 a 32 caracteres!");
                    return;
                }

                if (string.IsNullOrEmpty(ultimaChaveVenda))
                {
                    SatUtils.MostrarToast(MainActivity.mContext, "Digite uma chave de cancelamento!");
                    return;
                }

                repostaSat("CancelarUltimaVenda", codigoAtivacao, dadosVenda);
            }

            alerta = builder.Create();
            alerta.Show();
        }

        public void consultarSat()
        {
            repostaSat("ConsultarSat", GlobalValues.codigoAtivacao.ToString());
        }

        public void enviarVenda(string codAtivacao, string dadosVenda)
        {
            var codigoAtivacao = codAtivacao.ToString();
            if (!SatUtils.VerificaCodigoAtivacao(codigoAtivacao))
            {
                SatUtils.MostrarToast(MainActivity.mContext, "Código de Ativação deve ter entre 8 a 32 caracteres!");
                return;
            }

            repostaSat("EnviarTesteVendas", codigoAtivacao, dadosVenda);
        }

        public void secaoSat(string codAtivacao)
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.mContext);
            builder.SetTitle("Atenção");
            builder.SetMessage("Digite o número da sessão");
            EditText inputCodigoSessao = new EditText(MainActivity.mContext);
            inputCodigoSessao.SetRawInputType(InputTypes.ClassNumber);
            builder.SetView(inputCodigoSessao);
            builder.SetNeutralButton("OK", OkAction);
            inputCodigoSessao.Text = GlobalValues.ultimaSessao;

            void OkAction(object sender, DialogClickEventArgs e)
            {
                codigoSessao = inputCodigoSessao.Text.Trim();
                var codigoAtivacao = codAtivacao.ToString();

                if (!SatUtils.VerificaCodigoAtivacao(codigoAtivacao))
                {
                    SatUtils.MostrarToast(MainActivity.mContext, "Código de Ativação deve ter entre 8 a 32 caracteres!");
                    return;
                }

                if (string.IsNullOrEmpty(codigoSessao))
                {
                    SatUtils.MostrarToast(MainActivity.mContext, "Digite um número de sessão!");
                    return;
                }

                repostaSat("ConsultarNumeroSessao", codigoAtivacao);
            }
            alerta = builder.Create();
            alerta.Show();
        }

        public void statusSat(string codAtivacao)
        {
            var codigoAtivacao = codAtivacao.ToString();
            if (!SatUtils.VerificaCodigoAtivacao(codigoAtivacao))
            {
                SatUtils.MostrarToast(MainActivity.mContext, "Código de Ativação deve ter entre 8 a 32 caracteres!");
                return;
            }

            repostaSat("ConsultarStatusOperacional", codigoAtivacao);
        }

        public void testeSat(string codAtivacao, string dadosVenda)
        {
            var codigoAtivacao = codAtivacao.ToString();

            if (!SatUtils.VerificaCodigoAtivacao(codigoAtivacao))
            {
                SatUtils.MostrarToast(MainActivity.mContext, "Código de Ativação deve ter entre 8 a 32 caracteres!");
                return;
            }

            repostaSat("EnviarTesteFim", codigoAtivacao, dadosVenda);
        }

        public void repostaSat(string operacao, string txtCodAtivacao, string dadosVenda = "")
        {
            string retornoOperacao = "";
            switch (operacao)
            {
                case "ConsultarSat":
                    retornoOperacao = MainActivity.satFunctions.ConsultarSat(SatUtils.GerarNumeroSessao);
                    break;
                case "ConsultarStatusOperacional":
                    retornoOperacao = MainActivity.satFunctions.ConsultarStatusOperacional(SatUtils.GerarNumeroSessao, txtCodAtivacao);
                    break;
                case "EnviarTesteFim":
                    retornoOperacao = MainActivity.satFunctions.EnviarTesteFim(txtCodAtivacao, dadosVenda, SatUtils.GerarNumeroSessao);
                    break;
                case "EnviarTesteVendas":
                    retornoOperacao = MainActivity.satFunctions.EnviarTesteVendas(txtCodAtivacao, dadosVenda, SatUtils.GerarNumeroSessao);
                    break;
                case "CancelarUltimaVenda":
                    retornoOperacao = MainActivity.satFunctions.CancelarUltimaVenda(txtCodAtivacao, ultimaChaveVenda, dadosVenda, SatUtils.GerarNumeroSessao);
                    break;
                case "ConsultarNumeroSessao":
                    retornoOperacao = MainActivity.satFunctions.ConsultarNumeroSessao(txtCodAtivacao, Integer.ParseInt(codigoSessao), SatUtils.GerarNumeroSessao);
                    break;
                default:
                    retornoOperacao = "";
                    break;
            }


            RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat(operacao, retornoOperacao);
            /*
             * Está verificação(abaixo) tem como objetivo capturar a "Chave de Consulta" retornado na operação EnviarTesteVendas
             * O valor é armazenado em uma variavel global e quando o usuario abre a tela para cancelar venda, o campo (Chave de Cancelamento) já fica preenchido
             */
            if (operacao == "EnviarTesteVendas")
            {
                //chave ultima venda
                GlobalValues.ultimaChaveVenda = retornoSat.ChaveConsulta;
            }

            //GlobalValues.codigoAtivacao = txtCodAtivacao;
            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
            //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
            // Recomenda-se acessar a função e entender como ela funciona
            string retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
            SatUtils.DialogoRetorno(MainActivity.mContext, retornoFormatado);
        }

    }
}