package com.gertec.exemplosgertec.ExemploSAT.ServiceSAT;

public class RetornoSat {
    private String[] retornoPipe; // Armazena o retorno em forma de lista String
    private String operacao; // Armazena a operacao solicitada
    boolean retornoDiferente;
    private String retornoPipeCompleto;

    public RetornoSat(String operacao, String retornopipe) {
        this.retornoPipeCompleto = retornopipe;
        this.retornoPipe = retornopipe.split("\\|");
        this.operacao = operacao;
        /**
         O resultado das operações solicitadas é uma String divida por Pipes, exemplo: “numeroSessao|EEEEE|mensagem|cod|mensagemSEFAZ”
         Mas nem todos os retornos são padrões, existem alguns com posições diferentes de um mesmo valor.
         Para solucionar este obstaculo foi elabarado uma condição que verifica se a operação solicitada é uma das três(que possuem maior discrepância de posições)
         Caso sim, é retornado uma posição diferente do mesmo valor, caso contrario é retornado a posição padrão
         **/
        retornoDiferente = operacao.equals("AssociarSAT") || operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda");
    }

    // Retorna a String divida por pipe sem formatações
    public String getResultadoCompleto() {
        return retornoPipeCompleto;
    }

    // Retorna a operação solicitada

    public String getOperacao(){
        return operacao;
    }

    // Verifica se tem algum problema no retorno da operacao solicitada
    public String getErroSat() {
        //* Se o tamanho da lista de informações obtidas do retorno [_retornoPipe] for igual <= 1, provavelmente ocorreu um erro.
        if (retornoPipe.length <= 1) {
            // Verifica se houve um erro ao se conectar com o Sat
            if (retornoPipe[0].equals("Failed to find SAT device.")) {
                return "Dispositivo SAT não localizado";
            } else {
                // Caso não seja um erro de comunicação com o SAT retorna o erro que ocorreu
                return retornoPipe[0];
            }
        }
        //* Verifica se o código de ativação é invalido
        if (getMensagem().equals("Codigo de ativação inválido") || getMensagem().equals("Codigo ativação inválido")) {
            return getMensagem();
        }
        // Caso não exista nenhum erro
        return "";
    }

    public String getNumeroSessao() {
        try {
            return retornoPipe[0];
        } catch (Exception e) {
            return "";
        }
    }

    public String getNumeroEEEE() {
        try {
            return retornoPipe[1];
        } catch (Exception e) {
            return "";
        }
    }

    public String getMensagem() {
        try {
            if (retornoDiferente) return retornoPipe[3];
            return retornoPipe[2];
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente na três funções(AssociarSAT, Enviar Teste Venda e Cancelar Ultima Venda)
    public String getNumeroCCCC() {
        try {
            if (retornoDiferente) return retornoPipe[2];
            return "";
        } catch (Exception e) {
            return "";
        }
    }

    public String getNumeroCod() {
        try {
            if (retornoDiferente) return retornoPipe[4];
            return retornoPipe[3];
        } catch (Exception e) {
            return "";
        }
    }

    public String getMensagemSefaz() {
        try {
            if (retornoDiferente) return retornoPipe[5];
            return retornoPipe[4];
        } catch (Exception e) {
            return "";
        }
    }

    // Dado exclusivo do retorno da operação Ativar Sat
    public String getCodigoCSR() {
        try {
            if (operacao.equals("AtivarSAT")) return retornoPipe[5];
            return "";
        } catch (Exception e) {
            return "";
        }
    }

    // Dado exclusivo do retorno da operação Extrair Log
    public String getLogBase64() {
        try {
            if (operacao.equals("ExtrairLog")) return retornoPipe[5];
            return "";
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    public String getArquivoCFeBase64() {
        try {
            if (operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda")) {
                return retornoPipe[6];
            } else if (operacao.equals("EnviarTesteFim")) {
                return retornoPipe[5];
            } else {
                return "";
            }
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    public String getTimeStamp() {
        try {
            if (operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda")) {
                return retornoPipe[7];
            } else if (operacao.equals("EnviarTesteFim")) {
                return retornoPipe[6];
            } else {
                return "";
            }
        } catch (Exception e) {
            return "";
        }
    }

    // Dado exclusivo do retorno da operação TEnviarTesteFim
    public String getNumDocFiscal() {
        try {
            if (operacao.equals("EnviarTesteFim")) return retornoPipe[7];
            return "";
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    public String getChaveConsulta() {
        try {
            if (operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda") || operacao.equals("EnviarTesteFim"))
                return retornoPipe[8];
            return "";
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    public String getValorTotalCFe() {
        try {
            if (operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda"))
                return retornoPipe[9];
            else
                return "";
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    public String getCPFCNPJValue() {
        try {
            if (operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda"))
                return retornoPipe[10];
            else
                return "";
        } catch (Exception e) {
            return "";
        }
    }

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    public String getAssinaturaQRCODE() {
        try {
            if (operacao.equals("EnviarTesteVendas") || operacao.equals("CancelarUltimaVenda"))
                return retornoPipe[11];
            else
                return "";
        } catch (Exception e) {
            return "";
        }
    }

    public String getEstadoDeOperacao() {
        try {
            if (retornoPipe[27].equals("0"))
                return "DESBLOQUEADO";
            else if (retornoPipe[27].equals("1"))
                return "BLOQUEADO SEFAZ";
            else if (retornoPipe[27].equals("2"))
                return "BLOQUEIO CONTRIBUINTE";
            else if (retornoPipe[27].equals("3"))
                return "BLOQUEIO AUTÔNOMO";
            else if (retornoPipe[27].equals("4"))
                return "BLOQUEIO PARA DESATIVAÇÃO";
            else
                return "";
        } catch (Exception e) {
            return "";
        }
    }

    public String getNumeroSerieSat() {
        try {
            return retornoPipe[5] + "\n";
        } catch (Exception e) {
            return "";
        }
    }

    public String getTipoLan() {
        return retornoPipe[6] + "\n";
    }

    public String getIpSat() {
        return retornoPipe[7] + "\n";
    }

    public String getMacSat() {
        return retornoPipe[8] + "\n";
    }

    public String getMascara() {
        return retornoPipe[9] + "\n";
    }

    public String getGateway() {
        return retornoPipe[10] + "\n";
    }

    public String getDns1() {
        return retornoPipe[11] + "\n";
    }

    public String getDns2() {
        return retornoPipe[12] + "\n";
    }

    public String getStatusRede() {
        return retornoPipe[13] + "\n";
    }

    public String getNivelBateria() {
        return retornoPipe[14] + "\n";
    }

    public String getMemoriaDeTrabalhoTotal() {
        return retornoPipe[15] + "\n";
    }

    public String getMemoriaDeTrabalhoUsada() {
        return retornoPipe[16] + "\n";
    }

    public String getDataHora() {
        return retornoPipe[17].substring(6, 8) +
                "/" +
                retornoPipe[17].substring(4, 6) +
                "/" +
                retornoPipe[17].substring(0, 4) +
                "  " +
                retornoPipe[17].substring(8, 10) +
                ":" +
                retornoPipe[17].substring(10, 12) +
                ":" +
                retornoPipe[17].substring(12, 14) +
                "\n";
    }


    public String getVersao() {
        return retornoPipe[18] + "\n";
    }

    public String getVersaoLeiaute() {
        return retornoPipe[19] + "\n";
    }

    public String getUltimoCfeEmitido() {
        return retornoPipe[20] + "\n";
    }

    public String getPrimeiroCfeMemoria() {
        return retornoPipe[21] + "\n";
    }

    public String getUltimoCfeMemoria() {
        return retornoPipe[22] + "\n";
    }

    public String getUltimaTransmissaoSefazDataHora() {
        return retornoPipe[23].substring(6, 8) +
                "/" +
                retornoPipe[23].substring(4, 6) +
                "/" +
                retornoPipe[23].substring(0, 4) +
                " " +
                retornoPipe[23].substring(8, 10) +
                ":" +
                retornoPipe[23].substring(10, 12) +
                ":" +
                retornoPipe[23].substring(12, 14) +
                "\n";
    }


    public String getUltimaComunicacaoSefazData() {
        return retornoPipe[24].substring(6, 8) +
                "/" +
                retornoPipe[24].substring(4, 6) +
                "/" +
                retornoPipe[24].substring(0, 4) +
                " " +
                retornoPipe[24].substring(8, 10) +
                ":" +
                retornoPipe[24].substring(10, 12) +
                ":" +
                retornoPipe[24].substring(12, 14) +
                "\n";
    }

}
