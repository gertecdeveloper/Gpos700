package com.gertec.exemplosgertec.ExemploSAT.ServiceSAT;

import android.util.Base64;

import java.io.UnsupportedEncodingException;
import java.util.Map;

public class OperacaoSat {

    public static RetornoSat invocarOperacaoSat(String operacao, String respostaSat) {
        return new RetornoSat(operacao, respostaSat);
    }

    // Função que retorna uma String formatada para ser posta no dialogo Sat, com todas as informações do retorno da operação realizada
    // Em caso de erro retorna o erro
    // *Existem operações que vão ter como resultado informações semelhantes
    public static String formataRetornoSat(RetornoSat retornoSat) {
        String retornoFormatado = "";
        // Verifica se existe um erro no retorno
        if (retornoSat.getErroSat().equals("") == false) {
            // Retorna o erro caso exista
            return "Mensagem: " + retornoSat.getErroSat();
        } else {
            //* Estas informações são padrões a todos os retornos(sempre vão aparecer no Dialogo Sat)
            //* Para mais informações consulte o arquivo retornosSat.txt. É possivel visualizar nele a posição e informação de cada Retorno do Sat.
            if (retornoSat.getNumeroCCCC().equals("") == false) {
                // Se tiver Código CCCC adiciona ele a string formatada
                retornoFormatado = retornoSat.getNumeroEEEE() + "|" + retornoSat.getNumeroCCCC() + "-";
            } else {
                // Caso não tenha o código CCCC adicionada somente o EEEE
                retornoFormatado = retornoSat.getNumeroEEEE() + "-";
            }

            retornoFormatado += retornoSat.getMensagem();

            retornoFormatado += "\n"; // Pula linha

            // Verifica se adiciona o Código e Mensagem Sefaz na mensagem, caso não estejam vazios
            if (retornoSat.getNumeroCod().equals("") == false && retornoSat.getMensagemSefaz().equals("") == false) {
                retornoFormatado += "Cod/Mens Sefaz: \n" + retornoSat.getNumeroCod() + "-" + retornoSat.getMensagemSefaz();
            } else if (retornoSat.getNumeroCod().equals("") == false) {
                retornoFormatado += "Cod/Mens Sefaz: \n" + retornoSat.getNumeroCod() + "-";
            } else if (retornoSat.getMensagemSefaz().equals("") == false) {
                retornoFormatado += "Cod/Mens Sefaz: \n" + "-" + retornoSat.getMensagemSefaz();
            }

            retornoFormatado += "\n"; // Pula linha

            //* Agora só são inseridas as informações que não são padrões a todos retornos
            //* São atribuidas as informações especificas do retorno da operação
            if (retornoSat.getOperacao().equals("AtivarSAT")) {
                if (retornoSat.getCodigoCSR().equals("") == false) {
                    retornoFormatado += "CSR: " + retornoSat.getCodigoCSR();
                }
            } else if (retornoSat.getOperacao().equals("ExtrairLog")) {
                //! Cuidado com está parte, ela pode  exigir muito processamento se estiver em modo Debug
                //! Recomenda-se que utilize somente em modo release e não colocar em um Dialogo, pois o arquivo retornado é grande
                // retornoFormatado += "Arquivo de log em base64: " + retornoSat.getLogBase64;
            } else if (retornoSat.getOperacao().equals("ConsultarStatusOperacional")) {
                retornoFormatado += "------- Conteúdo Retorno -------" +
                        "\n" +
                        "Número de Série do SAT: " +
                        retornoSat.getNumeroSerieSat() +
                        "Tipo de Lan: " +
                        retornoSat.getTipoLan() +
                        "\n" +
                        "IP SAT: " +
                        retornoSat.getIpSat() +
                        "\n" +
                        "MAC SAT: " +
                        retornoSat.getMacSat() +
                        "\n" +
                        "Máscara: " +
                        retornoSat.getMascara() +
                        "\n" +
                        "Gateway: " +
                        retornoSat.getGateway() +
                        "\n" +
                        "DNS 1: " +
                        retornoSat.getDns1() +
                        "\n" +
                        "DNS 2: " +
                        retornoSat.getDns2() +
                        "\n" +
                        "Status da Rede: " +
                        retornoSat.getStatusRede() +
                        "\n" +
                        "Nível da Bateria: " +
                        retornoSat.getNivelBateria() +
                        "\n" +
                        "Memória de Trabalho Total: " +
                        retornoSat.getMemoriaDeTrabalhoTotal() +
                        "\n" +
                        "Memória de Trabalho Usada: " +
                        retornoSat.getMemoriaDeTrabalhoUsada() +
                        "\n" +
                        "Data/Hora: " +
                        retornoSat.getDataHora() +
                        "\n" +
                        "Versão: " +
                        retornoSat.getVersao() +
                        "\n" +
                        "Versão de Leiaute: " +
                        retornoSat.getVersaoLeiaute() +
                        "\n" +
                        "Último CFe-Sat Emitido: " +
                        retornoSat.getUltimoCfeEmitido() +
                        "\n" +
                        "Primeiro CFe-Sat Em Memória: " +
                        retornoSat.getPrimeiroCfeMemoria() +
                        "\n" +
                        "Último CFe-Sat Em Memória: " +
                        retornoSat.getUltimoCfeMemoria() +
                        "\n" +
                        "Última Transmissão de CFe-SAT para SEFAZ: " +
                        retornoSat.getUltimaTransmissaoSefazDataHora() +
                        "\n" +
                        "Última Comunicacao com a SEFAZ:" +
                        retornoSat.getUltimaComunicacaoSefazData() +
                        "\n" +
                        "Estado de Operação do SAT: " +
                        retornoSat.getEstadoDeOperacao();
            } else if (retornoSat.getOperacao().equals("AssociarSAT")) {
                //* Associar SAT somente tem como dado especifico o campo CCCC(fica ao seu criterio adicionar-lo ou não)
            } else if (retornoSat.getOperacao().equals("EnviarTesteFim")) {
                retornoFormatado += "TimeStamp: " +
                        retornoSat.getTimeStamp() +
                        "\nNum Doc Fiscal: " +
                        retornoSat.getNumDocFiscal() +
                        "\nChave de Consulta: " +
                        retornoSat.getChaveConsulta() +
                        "\nArquivo CFE Base 64: " +
                        converterBase64EmXml(retornoSat.getArquivoCFeBase64());
            } else if (retornoSat.getOperacao().equals("EnviarTesteVendas") || retornoSat.getOperacao().equals("CancelarUltimaVenda")) {
                retornoFormatado += "TimeStamp: " +
                        retornoSat.getTimeStamp() +
                        "\nChave de Consulta: " +
                        retornoSat.getChaveConsulta() +
                        "\nValor CFE: " +
                        retornoSat.getValorTotalCFe() +
                        "\nValor CPF CNPJ: " +
                        retornoSat.getCPFCNPJValue() +
                        "\nArquivo CFE Base 64: " +
                        converterBase64EmXml(retornoSat.getArquivoCFeBase64()) +
                        "\nAssinatura QRCODE: " +
                        retornoSat.getAssinaturaQRCODE();
            }
        }
        return retornoFormatado;
    }

    public static String converterBase64EmXml(String base64Sat) {
        String retornoSemBase64 = "";
        try {
            byte[] data = Base64.decode(base64Sat, Base64.DEFAULT);
            retornoSemBase64 = new String(data, "UTF-8");
            return retornoSemBase64;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return retornoSemBase64;
    }
}
