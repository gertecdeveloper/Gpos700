using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using GertecXamarinForms.Controls.Sat;
using GertecXamarinForms.Droid.Sat;
using GertecXamarinForms.Droid.SAT.PagesSat;
using GertecXamarinForms.Droid.SAT.ServiceSat;

[assembly: Xamarin.Forms.Dependency(typeof(Ferramentas))]
namespace GertecXamarinForms.Droid.SAT.PagesSat
{
    [Activity(Label = "Ferramentas")]
    public class Ferramentas : Activity, ISatFerramentas
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
        }

        public void atualizarSat(string codAtivacao, int numeroSersao)
        {

            RespostaSat("AtualizarSoftware", codAtivacao, numeroSersao);
        }

        public void bloquearSat(string codAtivacao, int numeroSersao)
        {

            RespostaSat("BloquearSat", codAtivacao, numeroSersao);
        }

        public void desbloquearSat(string codAtivacao, int numeroSersao)
        {

            RespostaSat("DesbloquearSat", codAtivacao, numeroSersao);
        }

        public void logSat(string codAtivacao, int numeroSersao)
        {

            try
            {
                RespostaSat("ExtrairLog", codAtivacao, numeroSersao);
            }
            catch (Exception e)
            {
                SatUtils.MostrarToast(MainActivity.mContext, e.Message);
            }
        }

        public void versaoSat(string codAtivacao, int numeroSersao)
        {
            RespostaSat("Versao", codAtivacao, numeroSersao);
        }

        public void RespostaSat(string operacao, string codAtivacao, int numSessao)
        {
            string retornoOperacao = "";
            switch (operacao)
            {
                case "BloquearSat":
                    retornoOperacao = MainActivity.satFunctions.BloquearSat(codAtivacao, numSessao);
                    break;
                case "DesbloquearSat":
                    retornoOperacao = MainActivity.satFunctions.DesbloquearSat(codAtivacao, numSessao);
                    break;
                case "ExtrairLog":
                    retornoOperacao = MainActivity.satFunctions.ExtrairLog(codAtivacao, numSessao);
                    break;
                case "AtualizarSoftware":
                    retornoOperacao = MainActivity.satFunctions.AtualizarSoftware(codAtivacao, numSessao);
                    break;
                case "Versao":
                    retornoOperacao = MainActivity.satFunctions.Versao();
                    break;
                default:
                    retornoOperacao = "";
                    break;
            }


            //GlobalValues.codigoAtivacao = codAtivacao;
            RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat(operacao, retornoOperacao);

            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
            //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
            // Recomenda-se acessar a função e entender como ela funciona
            string retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
            SatUtils.DialogoRetorno(MainActivity.mContext, retornoFormatado);
        }
        public void mostrarDialogo(string mensagem)
        {
            SatUtils.MostrarToast(MainActivity.mContext, mensagem);
            return;
        }
    }
}