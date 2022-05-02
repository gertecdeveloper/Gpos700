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
using GertecXamarinForms.Droid.Sat;

namespace GertecXamarinForms.Droid.SAT.ServiceSat
{
    public class OperacaoSat
    {

        public static RetornoSat invocarOperacaoSat(string operacao, string respostaSat)
        {
            return new RetornoSat(operacao, respostaSat);
        }

        // Função que retorna uma String formatada para ser posta no dialogo Sat, com todas as informações do retorno da operação realizada
        // Em caso de erro retorna o erro
        // *Existem operações que vão ter como resultado informações semelhantes
        public static string formataRetornoSat(RetornoSat retornoSat)
        {
            string retornoFormatado = "";
            // Verifica se existe um erro no retorno
            if (!(retornoSat.ErroSat == ""))
            {
                // Retorna o erro caso exista
                return "Mensagem: " + retornoSat.ErroSat;
            }
            else
            {
                //* Estas informações são padrões a todos os retornos(sempre vão aparecer no Dialogo Sat)
                //* Para mais informações consulte o arquivo retornosSat.txt. É possivel visualizar nele a posição e informação de cada Retorno do Sat.
                if (!(retornoSat.NumeroCCCC == ""))
                {
                    // Se tiver Código CCCC adiciona ele a string formatada
                    retornoFormatado = retornoSat.NumeroEEEE + "|" + retornoSat.NumeroCCCC + "-";
                }
                else
                {
                    // Caso não tenha o código CCCC adicionada somente o EEEE
                    retornoFormatado = retornoSat.NumeroEEEE + "-";
                }

                retornoFormatado += retornoSat.Mensagem;

                retornoFormatado += "\n"; // Pula linha

                // Verifica se adiciona o Código e Mensagem Sefaz na mensagem, caso não estejam vazios
                if (!(retornoSat.NumeroCod == "" || retornoSat.MensagemSefaz == ""))
                {
                    retornoFormatado += "Cod/Mens Sefaz: \n" + retornoSat.NumeroCod + "-" + retornoSat.MensagemSefaz;
                }
                else if (!(retornoSat.NumeroCod == ""))
                {
                    retornoFormatado += "Cod/Mens Sefaz: \n" + retornoSat.NumeroCod + "-";
                }
                else if (!(retornoSat.MensagemSefaz == ""))
                {
                    retornoFormatado += "Cod/Mens Sefaz: \n" + "-" + retornoSat.MensagemSefaz;
                }

                retornoFormatado += "\n"; // Pula linha

                //* Agora só são inseridas as informações que não são padrões a todos retornos
                //* São atribuidas as informações especificas do retorno da operação
                if (retornoSat.Operacao == "AtivarSAT")
                {
                    if (!(retornoSat.CodigoCSR == ""))
                    {
                        retornoFormatado += "CSR: " + retornoSat.CodigoCSR;
                    }
                }
                else if (retornoSat.Operacao == "ExtrairLog")
                {
                    //! Cuidado com está parte, ela pode  exigir muito processamento se estiver em modo Debug
                    //! Recomenda-se que utilize somente em modo release e não colocar em um Dialogo, pois o arquivo retornado é grande
                    // retornoFormatado += "Arquivo de log em base64: " + retornoSat.getLogBase64;
                }
                else if (retornoSat.Operacao == "ConsultarStatusOperacional")
                {
                    retornoFormatado += "------- Conteúdo Retorno -------" +
                            "\n" +
                            "Número de Série do SAT: " +
                            retornoSat.NumeroSerieSat +
                            "Tipo de Lan: " +
                            retornoSat.TipoLan +
                            "\n" +
                            "IP SAT: " +
                            retornoSat.IpSat +
                            "\n" +
                            "MAC SAT: " +
                            retornoSat.MacSat +
                            "\n" +
                            "Máscara: " +
                            retornoSat.Mascara +
                            "\n" +
                            "Gateway: " +
                            retornoSat.Gateway +
                            "\n" +
                            "DNS 1: " +
                            retornoSat.Dns1 +
                            "\n" +
                            "DNS 2: " +
                            retornoSat.Dns2 +
                            "\n" +
                            "Status da Rede: " +
                            retornoSat.StatusRede +
                            "\n" +
                            "Nível da Bateria: " +
                            retornoSat.NivelBateria +
                            "\n" +
                            "Memória de Trabalho Total: " +
                            retornoSat.MemoriaDeTrabalhoTotal +
                            "\n" +
                            "Memória de Trabalho Usada: " +
                            retornoSat.MemoriaDeTrabalhoUsada +
                            "\n" +
                            "Data/Hora: " +
                            retornoSat.DataHora +
                            "\n" +
                            "Versão: " +
                            retornoSat.Versao +
                            "\n" +
                            "Versão de Leiaute: " +
                            retornoSat.VersaoLeiaute +
                            "\n" +
                            "Último CFe-Sat Emitido: " +
                            retornoSat.UltimoCfeEmitido +
                            "\n" +
                            "Primeiro CFe-Sat Em Memória: " +
                            retornoSat.PrimeiroCfeMemoria +
                            "\n" +
                            "Último CFe-Sat Em Memória: " +
                            retornoSat.UltimoCfeMemoria +
                            "\n" +
                            "Última Transmissão de CFe-SAT para SEFAZ: " +
                            retornoSat.UltimaTransmissaoSefazDataHora +
                            "\n" +
                            "Última Comunicacao com a SEFAZ:" +
                            retornoSat.UltimaComunicacaoSefazData +
                            "\n" +
                            "Data de emissão do certificado: " +
                            retornoSat.DataEmissaoCertificado +
                            "\n" +
                            "Data de vencimento do certificado: " +
                            retornoSat.DataVencimentoCertificado +
                            "\n" +
                            "Estado de Operação do SAT: " +
                            retornoSat.EstadoDeOperacao;
                }
                else if (retornoSat.Operacao == "AssociarSAT")
                {
                    //* Associar SAT somente tem como dado especifico o campo CCCC(fica ao seu criterio adicionar-lo ou não)
                }
                else if (retornoSat.Operacao == "EnviarTesteFim")
                {
                    retornoFormatado += "TimeStamp: " +
                            retornoSat.TimeStamp +
                            "\nNum Doc Fiscal: " +
                            retornoSat.NumDocFiscal +
                            "\nChave de Consulta: " +
                            retornoSat.ChaveConsulta +
                            "\nArquivo CFE Base 64: " +
                            ConverterBase64EmXml(retornoSat.ArquivoCFeBase64);
                }
                else if ((retornoSat.Operacao == "EnviarTesteVendas") || (retornoSat.Operacao == "CancelarUltimaVenda"))
                {
                    retornoFormatado += "TimeStamp: " +
                            retornoSat.TimeStamp +
                            "\nChave de Consulta: " +
                            retornoSat.ChaveConsulta +
                            "\nValor CFE: " +
                            retornoSat.ValorTotalCFe +
                            "\nValor CPF CNPJ: " +
                            retornoSat.CPFCNPJValue +
                            "\nArquivo CFE Base 64: " +
                            ConverterBase64EmXml(retornoSat.ArquivoCFeBase64) +
                            "\nAssinatura QRCODE: " +
                            retornoSat.AssinaturaQRCODE;
                }
            }
            return retornoFormatado;
        }

        public static string ConverterBase64EmXml(string base64Sat)
        {
            byte[] data = Convert.FromBase64String(base64Sat);
            return System.Text.ASCIIEncoding.ASCII.GetString(data);
        }

    }
}