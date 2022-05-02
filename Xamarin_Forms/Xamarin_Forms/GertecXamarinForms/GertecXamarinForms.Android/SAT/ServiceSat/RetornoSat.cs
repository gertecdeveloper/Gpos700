using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace GertecXamarinForms.Droid.Sat
{
    public class RetornoSat
    {
        private string[] retornoPipe; // Armazena o retorno em forma de lista String
        private string operacao; // Armazena a operacao solicitada
        bool retornoDiferente;
        private string retornoPipeCompleto;

        public RetornoSat(string operacao, string retornopipe)
        {
            this.retornoPipeCompleto = retornopipe;
            this.retornoPipe = retornopipe.Split('|');
            this.operacao = operacao;
            /**
             O resultado das operações solicitadas é uma String divida por Pipes, exemplo: “numeroSessao|EEEEE|mensagem|cod|mensagemSEFAZ”
             Mas nem todos os retornos são padrões, existem alguns com posições diferentes de um mesmo valor.
             Para solucionar este obstaculo foi elabarado uma condição que verifica se a operação solicitada é uma das três(que possuem maior discrepância de posições)
             Caso sim, é retornado uma posição diferente do mesmo valor, caso contrario é retornado a posição padrão
             **/
            retornoDiferente = (operacao == "AssociarSAT") || (operacao == "EnviarTesteVendas") || (operacao == "CancelarUltimaVenda");
        }

        // Retorna a String divida por pipe sem formatações
        public string ResultadoCompleto => retornoPipeCompleto;

        // Retorna a operação solicitada

        public string Operacao => operacao;

        // Verifica se tem algum problema no retorno da operacao solicitada
        public string ErroSat
        {
            get
            {
                //* Se o tamanho da lista de informações obtidas do retorno [_retornoPipe] for igual <= 1, provavelmente ocorreu um erro.
                if (ExisteErroReposta)
                {
                    // Verifica se houve um erro ao se conectar com o Sat
                    if (Dados(0) == "Failed to find SAT device.")
                    {
                        return "Dispositivo SAT não localizado";
                    }
                    else
                    {
                        // Caso não seja um erro de comunicação com o SAT retorna o erro que ocorreu
                        return Dados(0);
                    }
                }
                //* Verifica se o código de ativação é invalido
                if ((Mensagem == "Codigo de ativação inválido") || (Mensagem == "Codigo ativação inválido"))
                {
                    return Mensagem;
                }
                // Caso não exista nenhum erro
                return "";
            }
        }

        public string NumeroSessao => Dados(0);

        public string NumeroEEEE => Dados(1);

        public string Mensagem => retornoDiferente ? Dados(3) : Dados(2);

        // Dado somente presente na três funções(AssociarSAT, Enviar Teste Venda e Cancelar Ultima Venda)
        public string NumeroCCCC => retornoDiferente ? Dados(2) : "";

        public string NumeroCod => retornoDiferente ? Dados(4) : Dados(3);

        public string MensagemSefaz => retornoDiferente ? Dados(5) : Dados(4);

        // Dado exclusivo do retorno da operação Ativar Sat
        public string CodigoCSR => (operacao == "AtivarSAT") ? Dados(5) : "";

        // Dado exclusivo do retorno da operação Extrair Log
        public string LogBase64 => (operacao == "ExtrairLog") ? Dados(5) : "";

        // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
        public string ArquivoCFeBase64
        {
            get
            {
                switch (operacao)
                {
                    case "EnviarTesteVendas":
                    case "CancelarUltimaVenda":
                        return Dados(6);
                    case "EnviarTesteFim":
                        return Dados(5);
                    default:
                        return "";
                }
            }
        }

        // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
        public string TimeStamp
        {
            get
            {
                switch (operacao)
                {
                    case "EnviarTesteVendas":
                    case "CancelarUltimaVenda":
                        return Dados(7);
                    case "EnviarTesteFim":
                        return Dados(6);
                    default:
                        return "";
                }
            }
        }

        // Dado exclusivo do retorno da operação TEnviarTesteFim
        public string NumDocFiscal => (operacao == "EnviarTesteFim") ? Dados(7) : "";

        // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
        public string ChaveConsulta
        {
            get
            {
                return ((operacao == "EnviarTesteVendas") || (operacao == "CancelarUltimaVenda") || (operacao == "EnviarTesteFim"))
                     ? Dados(8)
                     : "";

            }
        }

        // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
        public string ValorTotalCFe => ((operacao == "EnviarTesteVendas") || (operacao == "CancelarUltimaVenda")) ? Dados(9) : "";

        // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
        public string CPFCNPJValue => ((operacao == "EnviarTesteVendas") || (operacao == "CancelarUltimaVenda")) ? Dados(10) : "";

        // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
        public string AssinaturaQRCODE => ((operacao == "EnviarTesteVendas") || (operacao == "CancelarUltimaVenda")) ? Dados(11) : "";

        public string EstadoDeOperacao
        {
            get
            {
                switch (Dados(27))
                {
                    case "0":
                        return "DESBLOQUEADO";
                    case "1":
                        return "BLOQUEADO SEFAZ";
                    case "2":
                        return "BLOQUEIO CONTRIBUINTE";
                    case "3":
                        return "BLOQUEIO AUTÔNOMO";
                    case "4":
                        return "BLOQUEIO PARA DESATIVAÇÃO";
                    default:
                        return "";
                }
            }
        }

        public string NumeroSerieSat => Dados(5) + "\n";

        public string TipoLan => Dados(6) + "\n";

        public string IpSat => Dados(7) + "\n";

        public string MacSat => Dados(8) + "\n";

        public string Mascara => Dados(9) + "\n";

        public string Gateway => Dados(10) + "\n";

        public string Dns1 => Dados(11) + "\n";

        public string Dns2 => Dados(12) + "\n";

        public string StatusRede => Dados(13) + "\n";

        public string NivelBateria => Dados(14) + "\n";

        public string MemoriaDeTrabalhoTotal => Dados(15) + "\n";

        public string MemoriaDeTrabalhoUsada => Dados(16) + "\n";

        public string DataHora => FormataData(Dados(17)) + "\n";

        public string Versao => Dados(18) + "\n";

        public string VersaoLeiaute => Dados(19) + "\n";

        public string UltimoCfeEmitido => Dados(20) + "\n";

        public string PrimeiroCfeMemoria => Dados(21) + "\n";

        public string UltimoCfeMemoria => Dados(22) + "\n";

        public string UltimaTransmissaoSefazDataHora => FormataData(Dados(23)) + "\n";

        public string UltimaComunicacaoSefazData => FormataData(Dados(24)) + "\n";

        public string DataEmissaoCertificado => Dados(25) + "\n";

        public string DataVencimentoCertificado => Dados(26) + "\n";


        protected string Base64ToString(string encodedBase64)
        {
            byte[] data = Convert.FromBase64String(encodedBase64);
            return System.Text.ASCIIEncoding.ASCII.GetString(data);
        }

        protected string FormataData(string data)
        {
            try
            {
                return DateTime.ParseExact(data, "yyyyMMddHHmmss", null).ToString();
            }
            catch (Exception e)
            {
                return e.Message;
            }

        }

        protected string Dados(int index)
        {
            if ((index >= 0) && (index < retornoPipe.Length))
                return retornoPipe[index];
            else
                return "";
        }

        public bool ExisteErroReposta => retornoPipe.Length <= 1;


    }
}