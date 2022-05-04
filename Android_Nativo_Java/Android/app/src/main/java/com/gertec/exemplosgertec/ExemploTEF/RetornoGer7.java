package com.gertec.exemplosgertec.ExemploTEF;

import static java.lang.Integer.parseInt;

public class RetornoGer7 {

    private String version;
    private String status;
    private String config;
    private String license;
    private String terminal;
    private String merchant;
    private String id;
    private String type;
    private String product;
    private String response;
    private String authorization;
    private String amount;
    private String installments;
    private String instmode;
    private String stan;
    private String rrn;
    private String time;
    private String print;
    private String track2;
    private String aid;
    private String cardholder;
    private String prefname;
    private String errcode;
    private String errmsg;
    private String label;

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getTerminal() {
        return terminal;
    }

    public void setTerminal(String terminal) {
        this.terminal = terminal;
    }

    public String getMerchant() {
        return merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public String getAuthorization() {
        return authorization;
    }

    public void setAuthorization(String authorization) {
        this.authorization = authorization;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getInstallments() {
        return installments;
    }

    public void setInstallments(String installments) {
        this.installments = installments;
    }

    public String getInstmode() {
        return instmode;
    }

    public void setInstmode(String instmode) {
        this.instmode = instmode;
    }

    public String getStan() {
        return stan;
    }

    public void setStan(String stan) {
        this.stan = stan;
    }

    public String getRrn() {
        return rrn;
    }

    public void setRrn(String rrn) {
        this.rrn = rrn;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPrint() {
        return print;
    }

    public void setPrint(String print) {
        this.print = print;
    }

    public String getTrack2() {
        return track2;
    }

    public void setTrack2(String track2) {
        this.track2 = track2;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getCardholder() {
        return cardholder;
    }

    public void setCardholder(String cardholder) {
        this.cardholder = cardholder;
    }

    public String getPrefname() {
        return prefname;
    }

    public void setPrefname(String prefname) {
        this.prefname = prefname;
    }

    public String getErrcode() {
        return errcode;
    }

    public void setErrcode(String errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}

/// Classe de retorno, utilizada para atribuir o resultado do M-Sitef para um Json.
class RetornoMsiTef {
    private String CODRESP;
    private String COMP_DADOS_CONF;
    private String CODTRANS;
    private String VLTROCO;
    private String REDE_AUT;
    private String BANDEIRA;
    private String NSU_SITEF;
    private String NSU_HOST;
    private String COD_AUTORIZACAO;
    private String TIPO_PARC;
    private String NUM_PARC;
    private String VIA_ESTABELECIMENTO;
    private String VIA_CLIENTE;

    public String getNSUHOST (){
        return this.NSU_HOST;
    }
    public String getSitefTipoParcela(){
        return this.TIPO_PARC;
    }
    public String getNSUSitef(){
        return this.NSU_SITEF;
    }
    public String getCodTrans (){
        return this.CODTRANS;
    }
    public void setCodTrans (String _cODTRANS){
        this.CODTRANS= _cODTRANS;
    }
    public String getNameTransCod (){
        String retorno = "Valor invalido";
        switch (this.TIPO_PARC) {
            case "00":
                retorno = "A vista";
                break;
            case "01":
                retorno = "Pré-Datado";
                break;
            case "02":
                retorno = "Parcelado Loja";
                break;
            case "03":
                retorno = "Parcelado Adm";
                break;
        }
        return retorno;
    }

    public String getvlTroco (){
        return this.VLTROCO;
    }
    public String  getParcelas (){
        if (this.NUM_PARC != null) {
            return this.NUM_PARC;
        }
        return "";
    }

    public String getCodAutorizacao (){
        return this.COD_AUTORIZACAO;
    }
    public String textoImpressoEstabelecimento ()
    {
        return this.VIA_ESTABELECIMENTO;
    }
    public String textoImpressoCliente () { return this.VIA_CLIENTE;}
    public String getCompDadosConf (){return this.COMP_DADOS_CONF;}
    public String getCodResp (){return this.CODRESP;}
    public String getRedeAut (){return this.REDE_AUT;}
    public String getBandeira (){return this.BANDEIRA;}

}
