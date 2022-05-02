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
    public partial class Rede : ContentPage
    {
        public Rede()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

            tipoRede.Items.Add("Estático");
            tipoRede.Items.Add("DHCP");
            tipoRede.SelectedIndex = 1;

            optDns.Items.Add("Sim");
            optDns.Items.Add("Não");
            optDns.SelectedIndex = 1;

            optProxy.Items.Add("Não usa proxy");
            optProxy.Items.Add("Proxy com configuração");
            optProxy.Items.Add("Proxy transparente");
            optProxy.SelectedIndex = 0;

            txtCodAtivacao.Text = GlobalValuesSat.codigoAtivacao.ToString();

        }

        private void btnConfigurarRedeSat(object sender, EventArgs e)
        {
            if (!SatUteis.VerificaCodigoAtivacao(txtCodAtivacao.Text))
            {
                DependencyService.Get<ISatRede>().mostrarDialogo("Código de Ativação deve ter entre 8 a 32 caracteres!");
            }

            DependencyService.Get<ISatRede>().configurarRedeSat(txtCodAtivacao.Text.ToString(), SatUteis.GerarNumeroSessao);
        }


        private void optProxy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (optProxy.SelectedItem.ToString() == "Não usa proxy")
            {
                txtProxyIp.IsEnabled = false;
                txtPorta.IsEnabled = false;
                txtUser.IsEnabled = false;
                txtPassword.IsEnabled = false;
            }
            else
            {
                txtProxyIp.IsEnabled = true;
                txtPorta.IsEnabled = true;
                txtUser.IsEnabled = true;
                txtPassword.IsEnabled = true;
            }
        }

        private void tipoRede_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tipoRede.SelectedItem.ToString() == "Estático")
            {
                txtIp.IsEnabled = true;
                txtMascara.IsEnabled = true;
                txtGateway.IsEnabled = true;
            }
            else
            {
                txtIp.IsEnabled = false;
                txtMascara.IsEnabled = false;
                txtGateway.IsEnabled = false;
            }


        }

        private void optDns_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (optDns.SelectedItem.ToString() == "Não")
            {
                txtDns.IsEnabled = false;
                txtDns2.IsEnabled = false;
            }
            else
            {
                txtDns.IsEnabled = true;
                txtDns2.IsEnabled = true;
            }

        }
    }
}