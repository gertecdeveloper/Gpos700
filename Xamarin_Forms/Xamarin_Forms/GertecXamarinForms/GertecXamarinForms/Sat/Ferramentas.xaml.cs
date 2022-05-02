using GertecXamarinForms.Controls.Sat;
using GertecXamarinForms.Controls.Sat.ServicesSat;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GertecXamarinForms.Sat
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Ferramentas : ContentPage
    {
        public Ferramentas()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

            codAtivacao.Text = GlobalValuesSat.codigoAtivacao.ToString();
        }

        private void btnDesbloquerSat(object sender, EventArgs e)
        {
            if (!SatUteis.VerificaCodigoAtivacao(codAtivacao.Text))
            {
                DependencyService.Get<ISatFerramentas>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
            }

            DependencyService.Get<ISatFerramentas>().desbloquearSat(codAtivacao.Text.ToString(), SatUteis.GerarNumeroSessao);
        }

        private void btnBloquearSat(object sender, EventArgs e)
        {
            if (!SatUteis.VerificaCodigoAtivacao(codAtivacao.Text))
            {
                DependencyService.Get<ISatFerramentas>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
            }
            DependencyService.Get<ISatFerramentas>().bloquearSat(codAtivacao.Text.ToString(), SatUteis.GerarNumeroSessao);
        }

        private void btnExtrairLog(object sender, EventArgs e)
        {
            if (!SatUteis.VerificaCodigoAtivacao(codAtivacao.Text))
            {
                DependencyService.Get<ISatFerramentas>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
            }
            DependencyService.Get<ISatFerramentas>().logSat(codAtivacao.Text.ToString(), SatUteis.GerarNumeroSessao);
        }

        private void btnAtualizar(object sender, EventArgs e)
        {
            if (!SatUteis.VerificaCodigoAtivacao(codAtivacao.Text))
            {
                DependencyService.Get<ISatFerramentas>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
            }
            DependencyService.Get<ISatFerramentas>().atualizarSat(codAtivacao.Text.ToString(), SatUteis.GerarNumeroSessao);
        }

        private void btnVersao(object sender, EventArgs e)
        {
            DependencyService.Get<ISatFerramentas>().versaoSat(codAtivacao.Text.ToString(), SatUteis.GerarNumeroSessao);
        }
    }
}