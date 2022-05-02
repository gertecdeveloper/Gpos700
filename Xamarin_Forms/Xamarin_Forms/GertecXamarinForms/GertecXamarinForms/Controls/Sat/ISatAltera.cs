using System;
using System.Collections.Generic;
using System.Text;

namespace GertecXamarinForms.Controls.Sat
{
    public interface ISatAltera
    {
        void trocarCodAtivacao(string CodAtivacao, string opcao, string codAtivacaoNovo, string codConfirmacao, int numeroSessao);

        void mostrarDialogo(string mensagem);
    }
}
