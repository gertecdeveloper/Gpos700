using System;
using System.Collections.Generic;
using System.Text;

namespace GertecXamarinForms.Controls.Sat
{
    public interface ISatRede
    {
        void configurarRedeSat(string codAtivacao, int numeroSessao);
        void mostrarDialogo(string mensagem);
    }
}
