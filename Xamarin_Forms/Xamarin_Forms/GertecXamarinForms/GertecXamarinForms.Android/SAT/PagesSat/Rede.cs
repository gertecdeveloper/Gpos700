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

[assembly: Xamarin.Forms.Dependency(typeof(Rede))]
namespace GertecXamarinForms.Droid.SAT
{
    [Activity(Label = "Rede")]
    public class Rede : Activity, ISatRede
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
        }

        public void configurarRedeSat(string codAtivacao, int numeroSessao)
        {
            try
            {
                var codigoAtivacao = codAtivacao.ToString();

                ConfiguracaoRede config = new ConfiguracaoRede();

                string resp = MainActivity.satFunctions.EnviarConfRede(numeroSessao, config.GerarXml(), codigoAtivacao);
                RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("EnviarConfRede", resp);

                //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                // Recomenda-se acessar a função e entender como ela funciona
                //GlobalValues.codigoAtivacao = codigoAtivacao;
                String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);

                SatUtils.DialogoRetorno(MainActivity.mContext, retornoFormatado);

            }
            catch (Exception e)
            {
                Toast.MakeText(MainActivity.mContext, e.Message.ToString(), ToastLength.Long).Show();
            }
        }

        public void mostrarDialogo(string mensagem)
        {
            SatUtils.MostrarToast(MainActivity.mContext, mensagem);
            return;
        }
    }
}