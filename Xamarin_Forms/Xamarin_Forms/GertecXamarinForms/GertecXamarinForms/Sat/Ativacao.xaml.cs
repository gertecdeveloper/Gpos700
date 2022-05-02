using GertecXamarinForms.Controls;
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
    public partial class Ativacao : ContentPage
    {
        public static string codAtivacao;
        public Ativacao()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);
            cnpjContribuinte.Text = "03.654.119/0001-76";
            txtCodAtivacao.Text = GlobalValuesSat.codigoAtivacao.ToString();
                                    
        }

        private void ativacaoSat(object sender, EventArgs e)
        {
            if (!SatUteis.VerificaCodigoAtivacao(txtCodAtivacao.Text))
            {
                DependencyService.Get<ISatAtivacao>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
                return;
            }
            if (txtCodAtivacao.Text != txtCodConfirmacao.Text)
            {
                DependencyService.Get<ISatAtivacao>().mostrarDialogo("O Código de Ativação e a Confirmação do Código de Ativação não correspondem!");
                return;
            }
            else
            {
                GlobalValuesSat.codigoAtivacao = txtCodAtivacao.Text.ToString();

                DependencyService.Get<ISatAtivacao>().ativacaoSat(txtCodAtivacao.Text.ToString(),
                    UteisSat.SomenteNumeros(cnpjContribuinte.Text.ToString()),
                    txtCodConfirmacao.Text.ToString(), SatUteis.GerarNumeroSessao);
            }
        }
    }
}