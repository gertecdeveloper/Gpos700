export default class RetornoSat{
    constructor(operacao, retornoPipe){
        this.retornoPipeCompleto = retornoPipe;
        this._operacao = operacao;
        this.retornoPipe = retornoPipe.split("|");

        if(operacao == 'AssociarSAT' || operacao == 'EnviarTesteVendas' || operacao == 'CancelarUltimaVenda'){
            this.retornoDiferente = true;
        }else{
            this.retornoDiferente = false;
        }
    }

    // Retorna a String divida por pipe sem formatações
    getResultadoCompleto() {
        return this.retornoPipeCompleto;
    }

    // Retorna a operação solicitada

    getOperacao(){
        return this._operacao;
    }

    // Verifica se tem algum problema no retorno da operacao solicitada
    getErroSat(){
        //* Se o tamanho da lista de informações obtidas do retorno [_retornoPipe] for igual <= 1, provavelmente ocorreu um erro.
        if (this.retornoPipe.length <= 1) {
            // Verifica se houve um erro ao se conectar com o Sat
            if (this.retornoPipe[0] === "Failed to find SAT device.") {
                return "Dispositivo SAT não localizado";
            } else {
                // Caso não seja um erro de comunicação com o SAT retorna o erro que ocorreu
                return this.retornoPipe[0];
            }
        }
        //* Verifica se o código de ativação é invalido
        if (this.getMensagem() === "Codigo de ativação inválido" || this.getMensagem() === "Codigo ativação inválido"){
            return this.getMensagem();
        }
        // Caso não exista nenhum erro
        return "";
    }

    getNumeroSessao() {
        try {
            if(this.retornoPipe[0] != undefined){
                return this.retornoPipe[0];
            }else{
                return ""
            }
        } catch (err) {
            return "";
        }
    }

    getNumeroEEEE() {
        try {
            if(this.retornoPipe[1] != undefined){
                return this.retornoPipe[1];
            }else{
                return ""
            }
        } catch (err) {
            return "";
        }
    }

    getMensagem() {
        try {
            if (this.retornoDiferente){
                if(this.retornoPipe[3] != undefined){
                    return this.retornoPipe[3];
                }else{
                    return ""
                }
            }else{
                if(this.retornoPipe[2] != undefined){
                    return this.retornoPipe[2];
                }else{
                    return ""
                }
            };
        } catch (err) {
            return "";
        }
    }

    // Dado somente presente na três funções(AssociarSAT, Enviar Teste Venda e Cancelar Ultima Venda)
    getNumeroCCCC() {
        try {
            if (this.retornoDiferente){
                if(this.retornoPipe[2] != undefined){
                    return this.retornoPipe[2];
                }else{
                    return ""
                }
            }

            return "";
        } catch (err) {
            return "";
        }
    }

    getNumeroCod() {
        try {
            if (this.retornoDiferente){
                if(this.retornoPipe[4] != undefined){
                    return this.retornoPipe[4];
                }else{
                    return ""
                }
            }else{
                if(this.retornoPipe[3] != undefined){
                    return this.retornoPipe[3];
                }else{
                    return ""
                }
            }
        } catch (err) {
            return "";
        }
    }

    getMensagemSefaz() {
        try {
            if (this.retornoDiferente){
                if(this.retornoPipe[5] != undefined){
                    return this.retornoPipe[5];
                }else{
                    return ""
                }
            }else{
                if(this.retornoPipe[4] != undefined){
                    return this.retornoPipe[4];
                }else{
                    return ""
                }
            }
        } catch (err) {
            return "";
        }
    }

    // Dado exclusivo do retorno da operação Ativar Sat
    getCodigoCSR() {
        try {
            if (this._operacao == "AtivarSAT"){
                if(this.retornoPipe[5] != undefined){
                    return this.retornoPipe[5];
                }else{
                    return ""
                }
            }
            return "";
        } catch (err) {
            return "";
        }
    }

    // Dado exclusivo do retorno da operação Extrair Log
    getLogBase64() {
        try {
            if (this._operacao == "ExtrairLog"){
                if(this.retornoPipe[5] != undefined){
                    return this.retornoPipe[5];
                }else{
                    return ""
                }
            } 
            return "";
        } catch (err) {
            return "";
        }
    }

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    getArquivoCFeBase64() {
        try {
            if (this._operacao == "EnviarTesteVendas" || this._operacao == "CancelarUltimaVenda"){
                if(this.retornoPipe[6] != undefined){
                    return this.retornoPipe[6];
                }else{
                    return ""
                }
            } else if (this._operacao == "EnviarTesteFim") {
                if(this.retornoPipe[5] != undefined){
                    return this.retornoPipe[5];
                }else{
                    return ""
                }
            } else {
                return "";
            }
        } catch (err) {
            return "";
        }
    }

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    getTimeStamp() {
        try {
            if (this._operacao == "EnviarTesteVendas" || this._operacao == "CancelarUltimaVenda"){
                if(this.retornoPipe[7] != undefined) return this.retornoPipe[7]
                
                return "";
            } else if (this._operacao == "EnviarTesteFim") {
                if(this.retornoPipe[6] != undefined) return this.retornoPipe[6];
                
                return "";
            } else {
                return "";
            }
        } catch (err) {
            return "";
        }
    }

    // Dado exclusivo do retorno da operação TEnviarTesteFim
    getNumDocFiscal() {
        try {
            if (this._operacao == "EnviarTesteFim"){
                if(this.retornoPipe[7] != undefined){
                    return this.retornoPipe[7];
                }else{
                    return ""
                }
            }
            return "";
        } catch (err) {
            return "";
        }
    }

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    getChaveConsulta() {
        try {
            if (this._operacao == "EnviarTesteVendas" || this._operacao == "CancelarUltimaVenda" || this._operacao == "EnviarTesteFim"){
                if(this.retornoPipe[8] != undefined ) return this.retornoPipe[8];
                return "";
            }
            return "";
        } catch (err) {
            return "";
        }
    }

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    getValorTotalCFe() {
        try {
            if (this._operacao == "EnviarTesteVendas" || this._operacao == "CancelarUltimaVenda"){
                if(this.retornoPipe[9] != undefined) return this.retornoPipe[9];

                return ""
            } else{
                return "";
            }
        } catch (err) {
            return "";
        }
    } 

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    getCPFCNPJValue() {
        try {
            if (this._operacao == "EnviarTesteVendas" || this._operacao == "CancelarUltimaVenda"){
                if(this.retornoPipe[10] != undefined){
                    return this.retornoPipe[10];
                }else{
                    return ""
                }
            }else{
                return "";
            }
        } catch (err) {
            return "";
        }
    }

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    getAssinaturaQRCODE() {
        try {
            if (this._operacao == "EnviarTesteVendas" || this._operacao == "CancelarUltimaVenda"){
                if(this.retornoPipe[11] != undefined){
                    return this.retornoPipe[11];
                }else{
                    return ""
                }
            }
            return "";
        } catch (err) {
            return "";
        }
    }

    getEstadoDeOperacao() {
        try {
            if (this.retornoPipe[27] == "0")
                return "DESBLOQUEADO";
            else if (this.retornoPipe[27] == "1")
                return "BLOQUEADO SEFAZ";
            else if (this.retornoPipe[27] == "2")
                return "BLOQUEIO CONTRIBUINTE";
            else if (this.retornoPipe[27] == "3")
                return "BLOQUEIO AUTÔNOMO";
            else if (this.retornoPipe[27] == "4")
                return "BLOQUEIO PARA DESATIVAÇÃO";
            else
                return "";
        } catch (err) {
            return "";
        }
    }

    getNumeroSerieSat() {
        return this.retornoPipe[5] + "\n";
        /*
        try {
            
        } catch (err) {
            return "";
        }*/
    }

    getTipoLan() {
        return this.retornoPipe[6] + "\n";
    }

    getIpSat() {
        return this.retornoPipe[7] + "\n";
    }

    getMacSat() {
        return this.retornoPipe[8] + "\n";
    }

    getMascara() {
        return this.retornoPipe[9] + "\n";
    }

    getGateway() {
        return this.retornoPipe[10] + "\n";
    }

    getDns1() {
        return this.retornoPipe[11] + "\n";
    }

    getDns2() {
        return this.retornoPipe[12] + "\n";
    }

    getStatusRede() {
        return this.retornoPipe[13] + "\n";
    }

    getNivelBateria() {
        return this.retornoPipe[14] + "\n";
    }

    getMemoriaDeTrabalhoTotal() {
        return this.retornoPipe[15] + "\n";
    }

    getMemoriaDeTrabalhoUsada() {
        return this.retornoPipe[16] + "\n";
    }

    getDataHora() {
        return (
                this.retornoPipe[17].substring(6, 8) +
                "/" +
                this.retornoPipe[17].substring(4, 6) +
                "/" +
                this.retornoPipe[17].substring(0, 4) +
                "  " +
                this.retornoPipe[17].substring(8, 10) +
                ":" +
                this.retornoPipe[17].substring(10, 12) +
                ":" +
                this.retornoPipe[17].substring(12, 14) +
                "\n"
        );
    }


    getVersao() {
        return this.retornoPipe[18] + "\n";
    }

    getVersaoLeiaute() {
        return this.retornoPipe[19] + "\n";
    }

    getUltimoCfeEmitido() {
        return this.retornoPipe[20] + "\n";
    }

    getPrimeiroCfeMemoria() {
        return this.retornoPipe[21] + "\n";
    }

    getUltimoCfeMemoria() {
        return this.retornoPipe[22] + "\n";
    }

    getUltimaTransmissaoSefazDataHora() {
        return ( this.retornoPipe[23].substring(6, 8) +
                "/" +
                this.retornoPipe[23].substring(4, 6) +
                "/" +
                this.retornoPipe[23].substring(0, 4) +
                " " +
                this.retornoPipe[23].substring(8, 10) +
                ":" +
                this.retornoPipe[23].substring(10, 12) +
                ":" +
                this.retornoPipe[23].substring(12, 14) +
                "\n"
        );
    }


    getUltimaComunicacaoSefazData() {
        return ( this.retornoPipe[24].substring(6, 8) +
                "/" +
                this.retornoPipe[24].substring(4, 6) +
                "/" +
                this.retornoPipe[24].substring(0, 4) +
                " " +
                this.retornoPipe[24].substring(8, 10) +
                ":" +
                this.retornoPipe[24].substring(10, 12) +
                ":" +
                this.retornoPipe[24].substring(12, 14) +
                "\n"
        )
    }

    getDataEmissaoCertificado(){
        return this.retornoPipe[25] + "\n";
    }

    getDataVencimentoCertificado(){
        return this.retornoPipe[26] + "\n";
    }
}