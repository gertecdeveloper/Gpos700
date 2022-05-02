using System;
using System.Collections.Generic;
using System.Text;

namespace GertecXamarinForms.Controls.Sat.ServicesSat
{
    public class SatUteis
    {
        const int ATIVACAO_MINIMO = 8;
        const int ATIVACAO_MAXIMO = 32;
        static Random gerador = new Random();

        public static int GerarNumeroSessao
        {
            get
            {
                var sessao = gerador.Next(999999);
                GlobalValuesSat.ultimaSessao = sessao.ToString();
                return sessao;
            }
        }

        public static bool VerificaCodigoAtivacao(string codigo)
        {
            return (codigo.Length >= ATIVACAO_MINIMO && codigo.Length <= ATIVACAO_MAXIMO);
        }

        public static string SomenteNumeros(string texto)
        {
            return texto.Replace(".", "").Replace("/", "").Replace("-", "");
        }
    }
}
