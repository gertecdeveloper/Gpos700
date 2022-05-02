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
using GertecXamarinForms.Droid.SAT;
using GertecXamarinForms.Droid.SAT.ServiceSat;

[assembly: Xamarin.Forms.Dependency(typeof(Associacao))]
namespace GertecXamarinForms.Droid.SAT
{
    [Activity(Label = "Associacao")]
    public class Associacao : Activity, ISatAssociar
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
        }

        public void associarSat(string cnpjContribuinte, string cnpjSH, string codAtivacao, string assinatura, int numeroSessao)
        {
            var codigoAtivacao = codAtivacao.ToString();
            var assinaturaSat = assinatura.ToString();

            string resp = MainActivity.satFunctions.AssociarSat(
                cnpjContribuinte.ToString(), cnpjSH.ToString(),
                codigoAtivacao, assinaturaSat,
                numeroSessao);

            RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("AssociarSAT", resp);

            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
            //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
            // Recomenda-se acessar a função e entender como ela funciona
            string retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);

            SatUtils.DialogoRetorno(MainActivity.mContext, retornoFormatado);
            //GlobalValues.codigoAtivacao = codigoAtivacao;
        }
        public void mostrarDialogo(string mensagem)
        {
            SatUtils.MostrarToast(MainActivity.mContext, mensagem);
            return;
        }
    }
}