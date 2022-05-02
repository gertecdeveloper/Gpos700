using System;
using System.Collections.Generic;
using System.Text;

namespace GertecXamarinForms.Controls.Sat
{
    public interface ISatTestes
    {
        void consultarSat();
        void statusSat(string codAtivacao);
        void testeSat(string codAtivacao, string dadosVenda);
        void enviarVenda(string codAtivacao, string dadosVenda);
        void cancelarVenda(string codAtivacao, string dadosVenda);
        void secaoSat(string codAtivacao);
    }
}
