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

namespace GertecXamarinForms.Droid.SAT
{
    public class SatUtils
    {
        const int ATIVACAO_MINIMO = 8;
        const int ATIVACAO_MAXIMO = 32;
        static Random gerador = new Random();

        public static int GerarNumeroSessao
        {
            get
            {
                var sessao = gerador.Next(999999);
                GlobalValues.ultimaSessao = sessao.ToString();
                return sessao;
            }
        }

        public static bool VerificaCodigoAtivacao(string codigo)
        {
            return (codigo.Length >= ATIVACAO_MINIMO && codigo.Length <= ATIVACAO_MAXIMO);
        }

        public static void DialogoRetorno(Context context, string msg)
        {
            AlertDialog alertDialog = new AlertDialog.Builder(context).Create();
            alertDialog.SetTitle("Retorno");
            alertDialog.SetMessage(msg);
            alertDialog.SetButton("OK", (sender, e) => { });
            alertDialog.Show();

        }

        public static void MostrarToast(Context context, string msg)
        {
            Toast.MakeText(context, msg, ToastLength.Long).Show();
        }


        public static string SomenteNumeros(string texto)
        {
            return texto.Replace(".", "").Replace("/", "").Replace("-", "");
        }

    }
}