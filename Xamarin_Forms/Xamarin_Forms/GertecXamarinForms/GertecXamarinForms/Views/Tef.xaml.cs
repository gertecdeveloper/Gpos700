using GertecXamarinForms.Controls;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace GertecXamarinForms.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Tef : ContentPage
    {
        
        public Tef()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);

            valPag.Text = "1000";
            //ipEdit.Text = "192.168.0.5";
            qtdeParcelas.Text = "1";        
            checkBoxAbilitaImpressao.IsEnabled = false;
            checkBoxAbilitaImpressao.IsChecked = false;

        }

        private void checkBoxCreditoChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxCredito.IsChecked == true)
            {
                checkBoxDebito.IsChecked = false;
                checkBoxTodos.IsChecked = false;
            }
        }

        private void checkBoxDebitoChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxTodos.IsChecked || checkBoxDebito.IsChecked)
            {
                qtdeParcelas.Text = "1";
                qtdeParcelas.IsEnabled = false;
            }
            else
            {
                qtdeParcelas.IsEnabled = true;
            }

            if (checkBoxDebito.IsChecked == true)
            {
                checkBoxTodos.IsChecked = false;
                checkBoxCredito.IsChecked = false;
            }
        }

        private void checkBoxTodosChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxTodos.IsChecked || checkBoxDebito.IsChecked)
            {
                qtdeParcelas.Text = "1";
                qtdeParcelas.IsEnabled = false;
            }
            else
            {
                qtdeParcelas.IsEnabled = true;
            }

            if (checkBoxTodos.IsChecked == true)
            {
                checkBoxDebito.IsChecked = false;
                checkBoxCredito.IsChecked = false;
            }
        }

        private void checkParcLojaChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkParcLoja.IsChecked == true)
            {
                checkParcAdm.IsChecked = false;
            }
        }

        private void checkParcAdmChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkParcAdm.IsChecked == true)
            {
                checkParcLoja.IsChecked = false;
            }
        }

        private void checkGer7Changed(object sender, CheckedChangedEventArgs e)
        {
            if (checkGer7.IsChecked == true)
            {
                checkMstef.IsChecked = false;
                
            }
        }

        private void checkMstefChanged(object sender, CheckedChangedEventArgs e)
        {
            
            if (checkMstef.IsChecked == true)
            {
                ipEdit.IsEnabled = true;
                checkBoxAbilitaImpressao.IsEnabled = false;
                checkBoxAbilitaImpressao.IsChecked = false;
            }
            else
            {
                ipEdit.IsEnabled = false;
                checkBoxAbilitaImpressao.IsEnabled = true;
                checkBoxAbilitaImpressao.IsChecked = true;
            }

            if (checkMstef.IsChecked == true)
            {
                checkGer7.IsChecked = false;
            }
        }

        private void checkBoxAbilitaImpressaoChanged(object sender, CheckedChangedEventArgs e)
        {
            if (checkBoxAbilitaImpressao.IsChecked == true)
            {
                checkBoxAbilitaImpressao.IsChecked = true;
            }
            else
            {
                checkBoxAbilitaImpressao.IsChecked = false;
            }
        }

        private void btnEnviaTrasacao(object sender, EventArgs e)
        {
            
            string pagamento = "";
            string parcelamento = "Adm";

            if (checkBoxDebito.IsChecked)
            {
                pagamento = "DEBITO";

            }
            else if (checkBoxCredito.IsChecked)
            {
                pagamento = "CREDITO";
            }
            
            

            if (checkParcAdm.IsChecked)
            {
                parcelamento = "Adm";
            }else 
            {
                parcelamento = "Loja";
            }

            bool validaIp = DependencyService.Get<ITef>().validaIp(ipEdit.Text.ToString());            
            if (valPag.Text.ToString().Equals(0) || String.IsNullOrEmpty(valPag.Text.ToString()))
            {
                DisplayAlert("Erro ao executar função", "O valor de venda digitado deve ser maior que 0", "OK");
            }
            else if (checkMstef.IsChecked && !validaIp)
            {
                DisplayAlert("Erro ao executar função", "Digite um IP válido", "OK");
            }
            else
            {
                if (checkBoxCredito.IsChecked && String.IsNullOrEmpty(qtdeParcelas.Text))
                {
                    DisplayAlert("Erro ao executar função", "É necessário colocar o número de parcelas desejadas (obs.: Opção de compra por crédito marcada)", "OK");
                }
                else
                {
                    if (checkMstef.IsChecked)
                    {
                        int valor = int.Parse(valPag.Text.ToString().Replace("R$ ", "").Replace(",", "").Replace(".", ""));                                              
                        
                        DependencyService.Get<ITef>().executeSTefVenda(ipEdit.Text, valor, pagamento, int.Parse(qtdeParcelas.Text), parcelamento, checkBoxAbilitaImpressao.IsChecked);
                    }
                    else
                    {
                        int valor = int.Parse(valPag.Text.ToString().Replace("R$ ", "").Replace(",", "").Replace(".", ""));
                        DependencyService.Get<ITef>().executeGer7Venda(valor, int.Parse(qtdeParcelas.Text),pagamento,parcelamento,checkBoxAbilitaImpressao.IsChecked);
                    }
                }                
            }
           
        }

        private void btnCancelaTransacao(object sender, EventArgs e)
        {
            
            bool validaIp = DependencyService.Get<ITef>().validaIp(ipEdit.Text.ToString());
            
            if (valPag.Text.ToString().Equals(0) || String.IsNullOrEmpty(valPag.Text.ToString()))
            {
                DisplayAlert("Erro ao executar função", "O valor de venda digitado deve ser maior que 0", "OK");
            }
            else if (checkMstef.IsChecked && !validaIp)
            {
                DisplayAlert("Erro ao executar função", "Digite um IP válido", "OK");
            }
            else
            {
                if (checkMstef.IsChecked)
                {
                    int valor = int.Parse(valPag.Text.ToString().Replace("R$ ", "").Replace(",", "").Replace(".", ""));
                    DependencyService.Get<ITef>().executeSTefCancelamento(ipEdit.Text, valor, checkBoxAbilitaImpressao.IsChecked);
                }
                else
                {
                    DependencyService.Get<ITef>().executeGer7Cancelamento(checkBoxAbilitaImpressao.IsChecked);
                }
            }
           
        }

        private void btnFuncoes(object sender, EventArgs e)
        {
            
            bool validaIp = DependencyService.Get<ITef>().validaIp(ipEdit.Text.ToString());
            
            if (valPag.Text.ToString().Equals(0) || String.IsNullOrEmpty(valPag.Text.ToString()))
            {
                DisplayAlert("Erro ao executar função", "O valor de venda digitado deve ser maior que 0", "OK");
            }
            else if (checkMstef.IsChecked && !validaIp)
            {
                DisplayAlert("Erro ao executar função", "Digite um IP válido", "OK");
            }
            else
            {
                if (checkMstef.IsChecked)
                {
                    int valor = int.Parse(valPag.Text.ToString().Replace("R$ ", "").Replace(",", "").Replace(".", ""));
                    DependencyService.Get<ITef>().executeSTefFuncoes(ipEdit.Text, valor, checkBoxAbilitaImpressao.IsChecked);
                }
                else
                {
                    DependencyService.Get<ITef>().executeGer7Funcoes(checkBoxAbilitaImpressao.IsChecked);
                }
            }
            
        }

        private void btnReimpressao(object sender, EventArgs e)
        {
            
            bool validaIp = DependencyService.Get<ITef>().validaIp(ipEdit.Text.ToString());
            
            if (valPag.Text.ToString().Equals(0) || String.IsNullOrEmpty(valPag.Text.ToString()))
            {
                DisplayAlert("Erro ao executar função", "O valor de venda digitado deve ser maior que 0", "OK");
            }else if (checkMstef.IsChecked && !validaIp )
            {
                DisplayAlert("Erro ao executar função", "Digite um IP válido", "OK");
            }
            else
            {
                if (checkMstef.IsChecked)
                {
                    int valor = int.Parse(valPag.Text.ToString().Replace("R$ ", "").Replace(",", "").Replace(".", ""));
                    
                    DependencyService.Get<ITef>().execulteSTefReimpressao(ipEdit.Text, valor, checkBoxAbilitaImpressao.IsChecked);
                }
                else
                {                    
                    DependencyService.Get<ITef>().execulteGer7Reimpressao(checkBoxAbilitaImpressao.IsChecked);
                }
            }
            
        }                
    }
}