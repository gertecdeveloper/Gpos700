using System;
using System.Collections.Generic;
using System.Text;

namespace GertecXamarinForms.Controls.Sat
{
    public interface ISatFerramentas
    {
        void mostrarDialogo(string mensagem);
        void bloquearSat(string codAtivacao, int numeroSessao);
        void desbloquearSat(string codAtivacao, int numeroSessao);
        void logSat(string codAtivacao, int numeroSessao);
        void atualizarSat(string codAtivacao, int numeroSessao);
        void versaoSat(string codAtivacao, int numeroSessao);
    }
}
