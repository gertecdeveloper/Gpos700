import React from "react";
import base64 from 'react-native-base64';
import utf8 from 'utf8';
import {NativeModules} from 'react-native';
import RetornoSat from "./retornoSat";

var GertecGPOS700 = NativeModules.GertecGPOS700;

export default class OperacaoSat{
    invocarOperacaoSat(args){
        try{
            
            // DEVIDO A CRIAÇÃO DE UM ARQUIVO XML ATRAVÉS DE UM ARRAY NO REACT NATIVE
            // A FUNÇÃO CONFIGURAÇÃO DE REDE TEM UMA CLASSE PRÓPRIA PRA SER TRATADA
            // POR ISSO A CRIAÇÃO DE UMA CONDICONAL ANTES DE COMUNICAR COM A PARTE NATIVA

            if(args['funcao'] != 'EnviarConfRede'){
                GertecGPOS700.invocarMetodo(args);
            }else{
                GertecGPOS700.configRede(
                    args['random'],
                    args['codigoAtivar'],
                    args['dadosXml']
                );
            };
        }catch(err){
            return err;
        }
    }

    formataRetornoSat(retornoSat) {
        var retornoFormatado = '';
        
        if (retornoSat.getErroSat() != "") {
            return "Mensagem: " + retornoSat.getErroSat();

        } else {

            if (retornoSat.getNumeroCCCC() != "") {
                // Se tiver Código CCCC adiciona ele a string formatada
                retornoFormatado = retornoSat.getNumeroEEEE() + "|" + retornoSat.getNumeroCCCC();
            } else {
                // Caso não tenha o código CCCC adicionada somente o EEEE
                retornoFormatado = retornoSat.getNumeroEEEE();
            }
        
            retornoFormatado += " - " + retornoSat.getMensagem();

            retornoFormatado += "\n";

            if(retornoSat.getNumeroCod() != "" && retornoSat.getMensagemSefaz() != ""){
                retornoFormatado += "Cod/Mens Sefaz: " + "\n" + retornoSat.getNumeroCod() + '-' + retornoSat.getMensagemSefaz();
            }else{
                if (retornoSat.getNumeroCod() != "") {
                    retornoFormatado += retornoSat.getNumeroCod() + "/";
                }

                if (retornoSat.getMensagemSefaz() != "") {
                    retornoFormatado += "Mens Sefaz: " + retornoSat.getMensagemSefaz();
                }    
            }
            
            retornoFormatado += "\n";

            //* Agora só são inseridas as informações que não são padrões a todos retornos
            //* São atribuidas as informações especificas do retorno da operação

            if (retornoSat.getOperacao() == "AtivarSAT") {
                if (retornoSat.getCodigoCSR() != "") {
                    retornoFormatado += "CSR: " + retornoSat.getCodigoCSR();
                }
            } else if (retornoSat.getOperacao() == "ExtrairLog") {
                //! Cuidado com está parte, ela pode exigir muito processamento se estiver em modo Debug
                //! Recomenda-se que utilize somente em modo release e não colocar em um Dialogo, pois o arquivo retornado é grande
                // retornoFormatado += "Arquivo de log em base64: " + retornoSat.getLogBase64;
                //print(retornoSat.getLogBase64());

            } else if (retornoSat.getOperacao() == "ConsultarStatusOperacional"){
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
                    "Última Comunicacao com a SEFAZ: " +
                    retornoSat.getUltimaComunicacaoSefazData() +
                    "\n" +
                    "Data de Emissão do Certificado: " +
                    retornoSat.getDataEmissaoCertificado() +
                    "\n" +
                    "Data de Vencimento do Certificado: " +
                    retornoSat.getDataVencimentoCertificado() +
                    "\n" +
                    "Estado de Operação do SAT: " +
                    retornoSat.getEstadoDeOperacao()
            } else if (retornoSat.getOperacao() == "AssociarSAT") {
                //* Associar SAT somente tem como dado especifico o campo CCCC(fica ao seu criterio adicionar-lo ou não)
            } else if (retornoSat.getOperacao() == "EnviarTesteFim") {
                retornoFormatado += "TimeStamp: " +
                    retornoSat.getTimeStamp() +
                    "\nNum Doc Fiscal: " +
                    retornoSat.getNumDocFiscal() +
                    "\nChave de Consulta: " +
                    retornoSat.getChaveConsulta() +
                    "\nArquivo CFE Base 64: " +
                    this.converterBase64EmXml(retornoSat.getArquivoCFeBase64());

                    global.ChaveConsulta = retornoSat.getChaveConsulta();
            } else if (retornoSat.getOperacao() == "EnviarTesteVendas" || retornoSat.getOperacao() == "CancelarUltimaVenda") {
                retornoFormatado += "TimeStamp: " +
                    retornoSat.getTimeStamp() +
                    "\nChave de Consulta: " +
                    retornoSat.getChaveConsulta() +
                    "\nValor CFE: " +
                    retornoSat.getValorTotalCFe() +
                    "\nValor CPF CNPJ: " +
                    retornoSat.getCPFCNPJValue() +
                    "\nArquivo CFE Base 64: " + 
                    "\nAssinatura QRCODE: "+
                    retornoSat.getAssinaturaQRCODE() +
                    this.converterBase64EmXml(retornoSat.getArquivoCFeBase64());

                    global.ChaveConsulta = retornoSat.getChaveConsulta();
            }
        }

        return retornoFormatado;
    }

    // Função que converte o arquivo Base 64 em String
    converterBase64EmXml(base64Sat) {
        // Converte o arquivo Base 64 em String(vai ser usado para visualizar o Xml de resposta)
        //return utf8.decode(base64.decode(base64Sat));
        if(base64Sat != undefined){
            var decoded = base64.decode(base64Sat);
            var last_decoded = utf8.decode(decoded)
            return last_decoded;
        }else{
            return base64Sat;
        }
    }
}