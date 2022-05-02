using Android.App;
using Android.Content;
using Android.Widget;
using Android.OS;
using Plugin.DeviceInfo;
using System;
using GertecXamarinForms.Controls;
using Xamarin.Forms;
using GertecXamarinForms.Droid.Impressao;
using GertecXamarinForms.Droid.TEF;
using Java.Util;
using Newtonsoft.Json;
using System.Text;
using Java.Util.Regex;

[assembly: Xamarin.Forms.Dependency(typeof(Tef))]
namespace GertecXamarinForms.Droid.TEF
{
    [Activity(Label = "Tef")]
    public class Tef : Activity, ITef
    {               
        
        public Android.App.AlertDialog alerta;

        Intent intentGer7 = new Intent(Intent.ActionView, Android.Net.Uri.Parse("pos7api://pos7"));
        Venda venda = new Venda();

        private Locale mLocale = new Locale("pt", "BR");

        ///  Defines mSitef
        private static int REQ_CODE = 4713;
        private static int REQ_CODE_MSITEF = 4321;
        /// Fim Defines mSitef 

        /// Difines operação
        private static System.Random random = new System.Random();
        private string op = random.Next(99999).ToString();
        
        public Result RESULT_OK { get; private set; }

        //TEF
        private string GER7_API_VERSION = "1.04";
        private string GER7_CREDITO = "1";
        private string GER7_DEBITO = "2";
        private string GER7_VOUCHER = "4";
        private string GER7_REIMPRESSAO = "18";
        private string GER7_SEMPARCELAMENTO = "0";
        private string GER7_PARCELADO_LOJA = "1";
        private string GER7_PARCELADO_ADM = "2";
        private string GER7_DESABILITA_IMPRESSAO = "0";
        private string GER7_HABILITA_IMPRESSAO = "1";
        private string GER7_VENDA = "1";
        private string GER7_CANCELAMENTO = "2";
        private string GER7_FUNCOES = "3";
        public static string acao = "venda";
        private string current = "";
        private string Value = "";


        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);            
        }

        public void ResultadoTef(int requestCode, Result resultCode, Intent data)
        {
            if (requestCode == REQ_CODE_MSITEF)
            {
                if (requestCode == REQ_CODE_MSITEF && resultCode == Result.Ok)
                {
                    if (data.GetStringExtra("CODRESP").Equals("0"))
                    {
                        string impressao = "";
                        // Verifica se tem algo pra imprimir
                        if (!string.IsNullOrEmpty(data.GetStringExtra("VIA_CLIENTE")))
                        {
                            impressao += data.GetStringExtra("VIA_CLIENTE");
                        }
                        if (!string.IsNullOrEmpty(data.GetStringExtra("VIA_ESTABELECIMENTO")))
                        {
                            impressao += "\n\n-----------------------------     \n";
                            impressao += data.GetStringExtra("VIA_ESTABELECIMENTO");
                        }
                        if (!string.IsNullOrEmpty(impressao))
                        {
                            dialogImpressaoGPOS(impressao, 17, "MSITEF");
                        }
                    }
                    // Verifica se ocorreu um erro durante venda ou cancelamento
                    if (acao.Equals("venda") || acao.Equals("cancelamento"))
                    {
                        if (string.IsNullOrEmpty(data.GetStringExtra("CODRESP")) || !data.GetStringExtra("CODRESP").Equals("0"))
                        {
                            dialodTransacaoNegadaMsitef(data);
                        }
                        else
                        {
                            dialodTransacaoAprovadaMsitef(data);
                        }
                    }
                }
                else
                {
                    // ocorreu um erro
                    if (acao.Equals("venda") || acao.Equals("cancelamento"))
                    {
                        dialodTransacaoNegadaMsitef(data);
                    }
                }
            }
            else if (requestCode == REQ_CODE)
            {
                if (resultCode == Result.Ok)
                {
                    OperacaoRetorno retornoGer7 = JsonConvert.DeserializeObject<OperacaoRetorno>(data.GetStringExtra("jsonResp"));
                    // Verifica se tem algo pra imprimir

                    if (retornoGer7.errmsg == null && retornoGer7.print != null)
                    {
                        //Console.WriteLine(retornoGer7.print);
                        dialogImpressaoGPOS(retornoGer7.print, 17, "GER7");
                    }
                    if (acao.Equals("funcoes") && retornoGer7.errmsg != null)
                    {
                        dialodTransacaoNegadaGer7(retornoGer7);
                    }
                    // Verifica se ocorreu um erro durante venda ou cancelamento
                    if (acao == "venda" || acao == "cancelamento")
                    {
                        if (retornoGer7.errmsg != null)
                        {
                            dialodTransacaoNegadaGer7(retornoGer7);
                        }
                        else
                        {
                            dialodTransacaoAprovadaGer7(retornoGer7);
                        }
                    }
                }
                else
                {
                    OperacaoRetorno retornoGer7 = JsonConvert.DeserializeObject<OperacaoRetorno>(data.GetStringExtra("jsonResp"));
                    //ocorreu um erro durante venda ou cancelamento
                    if (acao == "venda" || acao == "cancelamento")
                    {
                        dialodTransacaoNegadaGer7(retornoGer7);
                    }
                }
            }
        }
        
        public void execulteGer7Reimpressao(bool impressao)
        {
            acao = "reimpressao";
            Console.WriteLine(impressao);
            if (impressao)
            {
                venda.receipt = GER7_HABILITA_IMPRESSAO;
            }
            else
            {
                venda.receipt = GER7_DESABILITA_IMPRESSAO;
            }
            venda.type = GER7_REIMPRESSAO;
            venda.id = random.Next(999999999).ToString();
            venda.apiversion = GER7_API_VERSION;

            string json = JsonConvert.SerializeObject(venda);
            intentGer7.PutExtra("jsonReq", json);

            ((Activity)Forms.Context).StartActivityForResult(intentGer7, REQ_CODE);
        }

        public void execulteSTefReimpressao(string ip, int valor, bool impressao)
        {
            acao = "reimpressao";
            //REQ_CODE = 4321;
            Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

            intentSitef.PutExtra("empresaSitef", "00000000");
            intentSitef.PutExtra("enderecoSitef", ip);
            intentSitef.PutExtra("operador", "0001");
            intentSitef.PutExtra("data", "20200324");
            intentSitef.PutExtra("hora", "130358");
            intentSitef.PutExtra("numeroCupom", op);

            intentSitef.PutExtra("valor", valor.ToString().Replace(",", "").Replace(".", ""));
            intentSitef.PutExtra("CNPJ_CPF", "03654119000176");
            intentSitef.PutExtra("comExterna", "0");

            intentSitef.PutExtra("modalidade", "114");

            intentSitef.PutExtra("isDoubleValidation", "0");
            intentSitef.PutExtra("caminhoCertificadoCA", "ca_cert_perm");

            //Removida esta opção v3.70
            /*if (impressao)
            {
                intentSitef.PutExtra("comprovante", "1");
            }
            else
            {
                intentSitef.PutExtra("comprovante", "0");
            }*/

            ((Activity)Forms.Context).StartActivityForResult(intentSitef, REQ_CODE_MSITEF);
        }

        public void executeGer7Cancelamento(bool impressao)
        {
            acao = "cancelamento";
            venda.type = GER7_CANCELAMENTO;
            venda.id = random.Next(999999999).ToString();

            if (impressao)
            {
                venda.receipt = GER7_HABILITA_IMPRESSAO;
            }
            else
            {
                venda.receipt = GER7_DESABILITA_IMPRESSAO;
            }

            venda.apiversion = GER7_API_VERSION;

            string json = JsonConvert.SerializeObject(venda);
            intentGer7.PutExtra("jsonReq", json);

            ((Activity)Forms.Context).StartActivityForResult(intentGer7, REQ_CODE);
        }

        public void executeGer7Funcoes(bool impressao)
        {
            acao = "funcoes";
            if (impressao)
            {
                venda.receipt = GER7_HABILITA_IMPRESSAO;
            }
            else
            {
                venda.receipt = GER7_DESABILITA_IMPRESSAO;
            }
            venda.type = GER7_FUNCOES;
            venda.id = random.Next(999999999).ToString();
            venda.apiversion = GER7_API_VERSION;

            string json = JsonConvert.SerializeObject(venda);
            intentGer7.PutExtra("jsonReq", json);

            ((Activity)Forms.Context).StartActivityForResult(intentGer7, REQ_CODE);
        }

        public void executeGer7Venda(int valor, int parcelas, string pagamento, string parcelamento, bool impressao)
        {
            acao = "venda";
            try
            {
                venda.type = GER7_VENDA;
                venda.id = random.Next(99999).ToString();
                //Console.WriteLine(venda.id);
                venda.amount = valor.ToString().Replace(",", "").Replace(".", "");
                //Console.WriteLine(venda.amount);
                venda.installments = parcelas.ToString();
                //Console.WriteLine(venda.installments);
                if (pagamento.Equals("DEBITO"))
                {
                    venda.setInstmode(this.GER7_SEMPARCELAMENTO);
                }
                else
                {
                    //Console.WriteLine(venda.installments);
                    if (venda.installments.Equals("0") || venda.installments.Equals("1"))
                    {
                        venda.instmode = GER7_SEMPARCELAMENTO;
                    }
                    else if (parcelamento.Equals("Loja"))
                    {
                        venda.instmode = GER7_PARCELADO_LOJA;
                    }
                    else if (parcelamento.Equals("Adm"))
                    {
                        venda.instmode = GER7_PARCELADO_ADM;
                    }
                }

                if (pagamento.Equals("CREDITO"))
                {
                    venda.product = GER7_CREDITO;
                }
                else if (pagamento.Equals("DEBITO"))
                {
                    venda.product = GER7_DEBITO;
                }
                else
                {
                    venda.product = GER7_VOUCHER;
                }

                if (impressao)
                {
                    venda.receipt = GER7_HABILITA_IMPRESSAO;
                }
                else
                {
                    venda.receipt = GER7_DESABILITA_IMPRESSAO;
                }

                venda.apiversion = GER7_API_VERSION;
                //Console.WriteLine(venda.apiversion);

                string json = JsonConvert.SerializeObject(venda);
                //Console.WriteLine(json);
                intentGer7.PutExtra("jsonReq", json);

                ((Activity)Forms.Context).StartActivityForResult(intentGer7, REQ_CODE);
            }
            catch (Exception e)
            {
                Toast.MakeText(MainActivity.mContext, e.Message, ToastLength.Long).Show();
            }
        }

        public void executeSTefCancelamento(string ip, int valor, bool impressao)
        {
            acao = "cancelamento";
            //REQ_CODE = 4321;
            Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

            intentSitef.PutExtra("empresaSitef", "00000000");
            intentSitef.PutExtra("enderecoSitef", ip);
            intentSitef.PutExtra("operador", "0001");
            intentSitef.PutExtra("data", MainActivity.currentDateTimeString);
            intentSitef.PutExtra("hora", MainActivity.currentDateTimeStringT);
            intentSitef.PutExtra("numeroCupom", op);

            intentSitef.PutExtra("valor", valor.ToString().Replace(",", "").Replace(".", ""));
            intentSitef.PutExtra("CNPJ_CPF", "03654119000176");
            intentSitef.PutExtra("comExterna", "0");

            intentSitef.PutExtra("modalidade", "200");

            intentSitef.PutExtra("isDoubleValidation", "0");
            intentSitef.PutExtra("caminhoCertificadoCA", "ca_cert_perm");
            //Removida esta opção v3.70
            /*if (impressao)
            {
                intentSitef.PutExtra("comprovante", "1");
            }
            else
            {
                intentSitef.PutExtra("comprovante", "0");
            }*/

            ((Activity)Forms.Context).StartActivityForResult(intentSitef, REQ_CODE_MSITEF);
        }

        public void executeSTefFuncoes(string ip, int valor, bool impressao)
        {
            acao = "funcoes";
            //REQ_CODE = 4321;
            Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

            intentSitef.PutExtra("empresaSitef", "00000000");
            intentSitef.PutExtra("enderecoSitef", ip);
            intentSitef.PutExtra("operador", "0001");
            intentSitef.PutExtra("data", MainActivity.currentDateTimeString);
            intentSitef.PutExtra("hora", MainActivity.currentDateTimeStringT);
            intentSitef.PutExtra("numeroCupom", op);

            intentSitef.PutExtra("valor", valor.ToString().Replace(",", "").Replace(".", ""));
            intentSitef.PutExtra("CNPJ_CPF", "03654119000176");
            intentSitef.PutExtra("comExterna", "0");

            intentSitef.PutExtra("isDoubleValidation", "0");
            intentSitef.PutExtra("caminhoCertificadoCA", "ca_cert_perm");

            //Removida esta opção v3.70
            /*if (impressao)
            {
                intentSitef.PutExtra("comprovante", "1");
            }
            else
            {
                intentSitef.PutExtra("comprovante", "0");
            }*/

            intentSitef.PutExtra("modalidade", "110");
            intentSitef.PutExtra("restricoes", "transacoesHabilitadas=16;26;27");

            ((Activity)Forms.Context).StartActivityForResult(intentSitef, REQ_CODE_MSITEF);
        }

        public void executeSTefVenda(string ip, int valor, string pagamento, int parcelas, string parcelamento, bool impressao)
        {
            acao = "venda";
            try
            {
                Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

                intentSitef.PutExtra("empresaSitef", "00000000");
                intentSitef.PutExtra("enderecoSitef", ip);
                intentSitef.PutExtra("operador", "0001");
                intentSitef.PutExtra("data", "20200324");
                intentSitef.PutExtra("hora", "130358");
                intentSitef.PutExtra("numeroCupom", op);

                intentSitef.PutExtra("valor", valor.ToString().Replace(",", "").Replace(".", ""));
                intentSitef.PutExtra("CNPJ_CPF", "03654119000176");
                intentSitef.PutExtra("comExterna", "0");

                if (pagamento.Equals("CREDITO"))
                {
                    intentSitef.PutExtra("modalidade", "3");
                    if (parcelas.ToString().Equals("0") || parcelas.ToString().Equals("1"))
                    {
                        intentSitef.PutExtra("transacoesHabilitadas", "26");
                    }
                    else if (parcelamento.Equals("Loja"))
                    {
                        // Essa informações habilida o parcelamento Loja
                        intentSitef.PutExtra("transacoesHabilitadas", "27");
                    }
                    else
                    {
                        // Essa informações habilida o parcelamento ADM
                        intentSitef.PutExtra("transacoesHabilitadas", "28");
                    }
                    intentSitef.PutExtra("numParcelas", parcelas.ToString());
                }else if (pagamento.Equals("DEBITO"))
                {
                    intentSitef.PutExtra("modalidade", "2");
                    intentSitef.PutExtra("transacoesHabilitadas", "16");
                }else 
                {
                    intentSitef.PutExtra("modalidade", "0");
                    intentSitef.PutExtra("restricoes", "transacoesHabilitadas=16");
                }

                intentSitef.PutExtra("isDoubleValidation", "0");
                intentSitef.PutExtra("caminhoCertificadoCA", "ca_cert_perm");

                //Removida esta opção v3.70
                /*if (impressao)
                {
                    intentSitef.PutExtra("comprovante", "1");
                }
                else
                {
                    intentSitef.PutExtra("comprovante", "0");
                }*/

                ((Activity)Forms.Context).StartActivityForResult(intentSitef, REQ_CODE_MSITEF);
            }
            catch (Exception e)
            {
                Toast.MakeText(MainActivity.mContext, e.Message, ToastLength.Long).Show();
            }
        }

        public void dialogImpressaoGPOS(String texto, int size, string api)
        {
            MainActivity.printer = new GertecPrinter(MainActivity.mContext);
            MainActivity.configPrint = new ConfigPrint();
            MainActivity.printer.setConfigImpressao(MainActivity.configPrint);

            //Console.WriteLine("Texto: " + texto.IndexOf("\n"));
            Android.App.AlertDialog alertDialog = new Android.App.AlertDialog.Builder(MainActivity.mContext).Create();
            StringBuilder cupom = new StringBuilder();
            cupom.Append("Deseja realizar a impressão pela aplicação?");
            alertDialog.SetTitle("Realizar Impressão");
            alertDialog.SetMessage(cupom.ToString());
            alertDialog.SetButton("Sim", OkAction);
            alertDialog.SetButton2("Não", CancelAction);
            alertDialog.Show();

            void OkAction(object sender, DialogClickEventArgs e)
            {
                String textoEstabelecimento = "";
                String textoCliente = "";

                MainActivity.configPrint.Alinhamento = ("LEFT");
                MainActivity.configPrint.Fonte = ("MONOSPACE");
                MainActivity.configPrint.Tamanho = (size);
                MainActivity.configPrint.Negrito = (true);
                MainActivity.configPrint.Italico = (false);
                MainActivity.configPrint.SubLinhado = (false);
                try
                {
                    MainActivity.printer.getStatusImpressora();
                    if (MainActivity.printer.IsImpressoraOK())
                    {
                        MainActivity.printer.setConfigImpressao(MainActivity.configPrint);
                        //Console.WriteLine("GertecPrinter" + printer);
                        if (api.Equals("GER7"))
                        {
                            textoEstabelecimento = texto.Substring(0, texto.IndexOf("\f"));
                            //Console.WriteLine("Aqui " + texto.Substring(0, texto.IndexOf("\f")));
                            textoCliente = texto.Substring(texto.IndexOf("\f"));

                            //printer.ImprimeTexto(textoEstabelecimento);
                            ImprimaGer7(textoEstabelecimento);
                            MainActivity.printer.AvancaLinha(100);
                            ImprimaGer7(textoCliente);
                            //printer.ImprimeTexto(textoCliente);
                        }
                        else
                        {
                            MainActivity.printer.ImprimeTexto(texto);
                        }
                        MainActivity.printer.AvancaLinha(150);
                    }
                    MainActivity.printer.ImpressoraOutput();
                }
                catch (System.Exception)
                {
                    Console.WriteLine(System.Environment.StackTrace);
                }
            }

            void CancelAction(object sender, DialogClickEventArgs e)
            {
                //não faz nada
                //Console.WriteLine("Não faz nada aqui");
            }
        }

        public void ImprimaGer7(String CupomTEF)
        {
            //Console.WriteLine(CupomTEF);
            if (!String.IsNullOrEmpty(CupomTEF))
            {
                int curPos = 0;
                int LastPos = 0;

                while (curPos >= 0)
                {
                    //TODO: Tratar exceção ultima Linha sem \n
                    curPos = CupomTEF.IndexOf("\n", curPos);
                    //Console.WriteLine("CupomTef" + CupomTEF.IndexOf("\n", curPos));
                    Console.WriteLine("Curpos" + curPos);
                    if (curPos > 0)
                    {
                        try
                        {
                            if (curPos > LastPos)
                            {
                                Console.WriteLine("LastPos" + LastPos);
                                //Console.WriteLine("CupomTEF.Substring" + CupomTEF.Substring(LastPos, curPos));
                                MainActivity.printer.ImprimeTexto(CupomTEF.Substring(LastPos, curPos - LastPos));
                                Console.WriteLine(CupomTEF.Substring(LastPos, curPos - LastPos));
                            }
                            else
                            {
                                MainActivity.printer.ImprimeTexto(" ");
                            }
                            curPos++;
                            LastPos = curPos;
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
            }
        }

        public void dialodTransacaoNegadaMsitef(Intent data)
        {
            Android.App.AlertDialog alertDialog = new Android.App.AlertDialog.Builder(MainActivity.mContext).Create();

            StringBuilder cupom = new StringBuilder();

            cupom.Append("CODRESP: " + data.GetStringExtra("CODRESP") + "\n");

            alertDialog.SetTitle("Ocorreu um erro durante a realização da ação");
            alertDialog.SetMessage(cupom.ToString());
            alertDialog.SetButton("OK", delegate
            {
                alertDialog.Dismiss();
            });
            alertDialog.Show();
        }

        public void dialodTransacaoAprovadaMsitef(Intent data)
        {
            Android.App.AlertDialog alertDialog = new Android.App.AlertDialog.Builder(MainActivity.mContext).Create();

            StringBuilder cupom = new StringBuilder();

            cupom.Append("CODRESP: " + data.GetStringExtra("CODRESP") + "\n");
            cupom.Append("COMP_DADOS_CONF: " + data.GetStringExtra("COMP_DADOS_CONF") + "\n");
            cupom.Append("CODTRANS: " + data.GetStringExtra("CODTRANS") + "\n");

            cupom.Append("CODTRANS: " + data.GetStringExtra("CODTRANS") + " " + Convert.ToString(retornaTipoParcelamento(Convert.ToInt32(data.GetStringExtra("TIPO_PARC")))) + "\n");

            cupom.Append("VLTROCO: " + data.GetStringExtra("VLTROCO") + "\n");
            cupom.Append("REDE_AUT: " + data.GetStringExtra("REDE_AUT") + "\n");
            cupom.Append("BANDEIRA: " + data.GetStringExtra("BANDEIRA") + "\n");

            cupom.Append("NSU_SITEF: " + data.GetStringExtra("NSU_SITEF") + "\n");
            cupom.Append("NSU_HOST: " + data.GetStringExtra("NSU_HOST") + "\n");
            cupom.Append("COD_AUTORIZACAO: " + data.GetStringExtra("COD_AUTORIZACAO") + "\n");
            cupom.Append("NUM_PARC: " + data.GetStringExtra("NUM_PARC") + "\n");

            alertDialog.SetTitle("Ação executada com sucesso");
            alertDialog.SetMessage(cupom.ToString());
            alertDialog.SetButton("OK", delegate
            {
                alertDialog.Dismiss();
            });
            alertDialog.Show();
        }

        private string retornaTipoParcelamento(int op)
        {
            string retorno = "Valor invalido";

            switch (op)
            {
                case 0:
                    retorno = "A vista";
                    break;
                case 1:
                    retorno = "Pré-Datado";
                    break;
                case 2:
                    retorno = "Parcelado Loja";
                    break;
                case 3:
                    retorno = "Parcelado Adm";
                    break;
            }
            return retorno;
        }

        public void dialodTransacaoNegadaGer7(OperacaoRetorno retorno)
        {
            Android.App.AlertDialog alertDialog = new Android.App.AlertDialog.Builder(MainActivity.mContext).Create();

            StringBuilder cupom = new StringBuilder();

            cupom.Append("version: " + retorno.version + "\n");
            cupom.Append("errcode: " + retorno.errcode + "\n");
            cupom.Append("errmsg: " + retorno.errmsg + "\n");

            alertDialog.SetTitle("Ocorreu um erro durante a realização da ação");
            alertDialog.SetMessage(cupom.ToString());
            alertDialog.SetButton("OK", delegate
            {
                alertDialog.Dismiss();
            });
            alertDialog.Show();
        }

        public void dialodTransacaoAprovadaGer7(OperacaoRetorno retorno)
        {
            Android.App.AlertDialog alertDialog = new Android.App.AlertDialog.Builder(MainActivity.mContext).Create();
            StringBuilder cupom = new StringBuilder();

            cupom.Append("version: " + retorno.version + "\n");
            cupom.Append("status: " + retorno.status + "\n");
            cupom.Append("config: " + retorno.config + "\n");
            cupom.Append("license: " + retorno.license + "\n");
            cupom.Append("terminal: " + retorno.terminal + "\n");
            cupom.Append("merchant: " + retorno.merchant + "\n");
            cupom.Append("id: " + retorno.id + "\n");
            cupom.Append("type: " + retorno.type + "\n");
            cupom.Append("product: " + retorno.product + "\n");
            cupom.Append("response: " + retorno.response + "\n");
            cupom.Append("authorization: " + retorno.authorization + "\n");
            cupom.Append("amount: " + retorno.amount + "\n");
            cupom.Append("installments: " + retorno.installments + "\n");
            cupom.Append("instmode: " + retorno.instmode + "\n");
            cupom.Append("stan: " + retorno.stan + "\n");
            cupom.Append("rrn: " + retorno.rrn + "\n");
            cupom.Append("time: " + retorno.time + "\n");
            cupom.Append("track2: " + retorno.track2 + "\n");
            cupom.Append("aid: " + retorno.aid + "\n");
            cupom.Append("cardholder: " + retorno.cardholder + "\n");
            cupom.Append("prefname: " + retorno.prefname + "\n");
            cupom.Append("errcode: " + retorno.errcode + "\n");
            cupom.Append("label: " + retorno.label + "\n");

            alertDialog.SetTitle("Ação executada com sucesso");
            alertDialog.SetMessage(cupom.ToString());
            alertDialog.SetButton("OK", delegate
            {
                alertDialog.Dismiss();
            });
            alertDialog.Show();
        }

        public bool validaIp(string ipserver)
        {            
            Java.Util.Regex.Pattern p = Java.Util.Regex.Pattern.Compile("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$");
            Matcher m = p.Matcher(ipserver);
            bool b = m.Matches();
            Console.WriteLine(b);
            return b;
        }
                
    }
}