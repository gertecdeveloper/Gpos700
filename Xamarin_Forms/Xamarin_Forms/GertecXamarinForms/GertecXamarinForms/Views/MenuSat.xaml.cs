
using GertecXamarinForms.Sat;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GertecXamarinForms.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MenuSat : ContentPage
    {
        public MenuSat()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);
        }

        private void btnAtivacao(object sender, EventArgs e)
        {
            //System.Console.WriteLine("Teste Ativação");
            Navigation.PushAsync(new Ativacao());
        }

        private void btnAlterar(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Alterar());
        }

        private void btnAssociar(object sender, EventArgs e)
        {
            Navigation.PushAsync(new AssociarSat());
        }

        private void btnFerramentas(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Ferramentas());
        }

        private void btnTesteSat(object sender, EventArgs e)
        {
            Navigation.PushAsync(new TestesSat());
        }

        private void btnRede(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Rede());
        }
    }
}