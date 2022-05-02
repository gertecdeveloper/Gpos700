using System;
using System.Text;
using System.IO;
using System.Xml.Serialization;
using Android.Content;
using Com.Phi.Gertec.Sat.Satger;

namespace GertecXamarinForms.Droid.Sat
{
    // Classe utilizada para a geração do XML de configuração da rede
    [XmlRootAttribute("config", Namespace = "", IsNullable = false)]
    public class ConfiguracaoRede
    {
        public string tipoInter;
        public string tipoLan;
        public string SSID;
        public string seg;
        public string Codigo;
        public string lanIP;
        public string lanMask;
        public string lanGW;
        public string lanDNS1;
        public string lanDNS2;
        public string usuario;
        public string senha;
        public string proxy;
        public string proxy_ip;
        public string proxy_porta;
        public string proxy_user;
        public string proxy_senha;

        public string GerarXml()
        {

            XmlSerializerNamespaces ns = new XmlSerializerNamespaces();
            ns.Add("", "");

            XmlSerializer xmlSerializer = new XmlSerializer(this.GetType());
            using (StringWriter textWriter = new StringWriter())
            {
                xmlSerializer.Serialize(textWriter, this, ns);
                return textWriter.ToString();
            }
        }
    }


    public class SatFunctions : Java.Lang.Throwable
    {
        public static SatGerLib serialComms;
        private string arquivoXmlVendas = "arq_venda"; // Armazena o nome do arquivo
        private string arquivoXmlCancelamento = "arq_cancelamento"; // Armazena o nome do arquivo
        private Context myContext;

        public SatFunctions(Context context)
        {
            myContext = context;
            SatGerLib.IOnDataReceived x = new InterfaceData();
            serialComms = new SatGerLib(context, x); // Inicializando
        }

        public string EnviarConfRede(int random, string config, string codigoAtivacao)
        {

            try
            {
                return serialComms.ConfigurarInterfaceDeRede(random, codigoAtivacao, config);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }
        }

        public string Versao()
        {

            return serialComms.VersaoDllGerSAT();

        }

        public string AtualizarSoftware(string codAtivacao, int codigoSessao)
        {
            try
            {
                return serialComms.AtualizarSAT(codigoSessao, codAtivacao);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }

        }

        public string ExtrairLog(string codAtivacao, int codigoSessao)
        {
            try
            {
                return serialComms.ExtrairLogs(codigoSessao, codAtivacao);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }
        }

        public string DesbloquearSat(string codAtivacao, int codigoSessao)
        {
            try
            {
                return serialComms.DesbloquearSAT(codigoSessao, codAtivacao);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }

        }

        public string BloquearSat(string codAtivacao, int codigoSessao)
        {
            try
            {
                return serialComms.BloquearSAT(codigoSessao, codAtivacao);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }

        }

        public string TrocarCodAtivacao(string codAtual, int opt, string codNovo, int codigoSessao)
        {
            try
            {
                return serialComms.TrocarCodigoDeAtivacao(codigoSessao, codAtual, opt, codNovo, codNovo);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }


        }

        public string ConsultarNumeroSessao(string codAtivacao, int cNumeroDeSessao, int codigoSessao)
        {
            try
            {
                return serialComms.ConsultarNumeroSessao(codigoSessao, codAtivacao, cNumeroDeSessao);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }

        }

        public string CancelarUltimaVenda(string codAtivacao, string chave, string dadosVenda, int codigoSessao)
        {
            try
            {
                return serialComms.CancelarUltimaVenda(codigoSessao, codAtivacao, chave, dadosVenda.Replace("trocarCfe", chave));
            }
            catch (System.Exception e)
            {
                return e.Message;
            }
        }
        public string EnviarTesteVendas(string codAtivacao, string dadosVenda, int codigoSessao)
        {
            try
            {
                return serialComms.EnviarDadosVenda(codigoSessao, codAtivacao, dadosVenda);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }
        }

        public string EnviarTesteFim(string codAtivacao, string dadosVenda, int codigoSessao)
        {
            try
            {
                return serialComms.TesteFimAFim(codigoSessao, codAtivacao, dadosVenda);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }


        }

        public string ConsultarStatusOperacional(int codigoSessao, string codAtivacao)
        {
            try
            {
                return serialComms.ConsultarStatusOperacional(codigoSessao, codAtivacao);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }


        }

        public string ConsultarSat(int codigoSessao)
        {

            try
            {

                return serialComms.ConsultarSAT(codigoSessao);
            }

            catch (System.Exception e)
            {
                return e.Message;
            }
        }

        public string AssociarSat(string cnpj, string cnpjSW, string codAtivacao, string assinatura, int codigoSessao)
        {
            try
            {
                return serialComms.AssociarAssinatura(codigoSessao, codAtivacao, cnpjSW + "" + cnpj, assinatura);

            }
            catch (System.Exception e)
            {
                return e.Message;
            }
        }

        public string AtivarSat(string codAtivacao, string cnpj, int codigoSessao)
        {
            try
            {
                return serialComms.AtivarSAT(codigoSessao, 1, codAtivacao, cnpj, 35);
            }
            catch (System.Exception e)
            {
                return e.Message;
            }


        }


        protected string CarregarArquivo(string nomeArquivo)
        {
            var stream = myContext.Resources.OpenRawResource(myContext.Resources.GetIdentifier(nomeArquivo, "raw", myContext.PackageName));
            string conteudoArquivo = "";
            using (var reader = new System.IO.StreamReader(stream))
            {
                conteudoArquivo = reader.ReadToEnd();
            }
            return conteudoArquivo;

        }
    }

    public class InterfaceData : Java.Lang.Object, SatGerLib.IOnDataReceived
    {
        public void OnError(Java.Lang.Exception e)
        {
            System.Console.WriteLine(System.Environment.StackTrace);
        }

        public void OnReceivedDataUpdate(string s)
        {

            try
            {
                // Trata o retorno da função
                string[] respostaSplited;
                respostaSplited = s.Split('|');
                byte[] ptext = Encoding.Default.GetBytes(respostaSplited[2]);
                string value = Encoding.UTF8.GetString(ptext);
            }
            catch (System.Exception e)
            {
                System.Console.WriteLine(e.Message);
            }
        }

    }
}