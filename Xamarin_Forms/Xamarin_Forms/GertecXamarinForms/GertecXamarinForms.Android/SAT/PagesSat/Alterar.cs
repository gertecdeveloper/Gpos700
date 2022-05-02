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

[assembly: Xamarin.Forms.Dependency(typeof(Alterar))]
namespace GertecXamarinForms.Droid.SAT.PagesSat
{
    [Activity(Label = "Alterar")]
    public class Alterar : Activity, ISatAltera
    {
        private int op = 1;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
        }

        public void trocarCodAtivacao(string CodAtivacao, string opcao, string codAtivacaoNovo, string codConfirmacao, int numerSessao)
        {
            try
            {
                var codigoAtivacaoAtual = CodAtivacao.ToString();
                var codigoAtivacaoNovo = codAtivacaoNovo.ToString();
                var codigoAtivacaoNovoConfirmacao = codConfirmacao.ToString();


                op = opcao.ToString().Equals("Código de ativação") ? 1 : 2;

                //GlobalValues.codigoAtivacao = codigoAtivacaoNovo;
                string retorno = MainActivity.satFunctions.TrocarCodAtivacao(codigoAtivacaoAtual, op, codigoAtivacaoNovo, numerSessao);
                RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("TrocarCodAtivacao", retorno);

                string retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
                SatUtils.DialogoRetorno(MainActivity.mContext, retornoFormatado);

            }
            catch (Exception e)
            {
                SatUtils.MostrarToast(MainActivity.mContext, e.Message);
            }
        }

        public void mostrarDialogo(string mensagem)
        {
            SatUtils.MostrarToast(MainActivity.mContext, mensagem);
            return;
        }
    }
}