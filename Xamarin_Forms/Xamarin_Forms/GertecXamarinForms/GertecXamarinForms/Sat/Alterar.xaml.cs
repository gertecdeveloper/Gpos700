using GertecXamarinForms.Controls;
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
    public partial class Alterar : ContentPage
    {
        public Alterar()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

            opcoes.Items.Add("Código de ativação");
            opcoes.Items.Add("Código de Emergência");
            opcoes.SelectedIndex = 0;

            txtCodAtivacao.Text = GlobalValuesSat.codigoAtivacao.ToString();
        }

        private void btnAlterar(object sender, EventArgs e)
        {
            int selected = opcoes.SelectedIndex;
            string escolha = opcoes.Items[selected];

            if (!SatUteis.VerificaCodigoAtivacao(txtCodAtivacao.Text) || !SatUteis.VerificaCodigoAtivacao(txtCodNovo.Text) || !SatUteis.VerificaCodigoAtivacao(txtCodConfirmacao.Text))
            {
                DependencyService.Get<ISatAltera>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
                return;
            }
            if (txtCodNovo.Text != txtCodConfirmacao.Text)
            {
                DependencyService.Get<ISatAltera>().mostrarDialogo("O Novo Código de Ativação e a Confirmação do Novo Código de Ativação não correspondem!");
                return;
            }

            DependencyService.Get<ISatAltera>().trocarCodAtivacao(txtCodAtivacao.Text.ToString(), escolha,
                                                        txtCodNovo.Text.ToString(), txtCodConfirmacao.Text.ToString(), SatUteis.GerarNumeroSessao);

            GlobalValuesSat.codigoAtivacao = txtCodNovo.Text.ToString();

        }
    }
}