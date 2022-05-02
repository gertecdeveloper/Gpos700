using System;
using System.Collections.Generic;
using System.Text;

namespace GertecXamarinForms.Controls.Sat
{
    public interface ISatAssociar
    {
        void mostrarDialogo(string mensagem);
        void associarSat(string cnpjContribuinte, string cnpjSH, string codAtivacao, string assinatura, int numeroSessao);
    }
}
