import { version } from "react";

export default class RetornoGer7{
    fromJsonGer7(json){
      // json = JSON.parse(json)
      this._version = json.version;
      this._status = json.status;
      this._config= json.config;
      this._license = json.license;
      this._terminal = json.terminal;
      this._merchant = json.merchant;
      this._id = json.id;
      this._type = json.type;
      this._product = json.product;
      this._response = json.response;
      this._authorization = json.authorization;
      this._amount = json.amount;
      this._installments = json.installments;
      this._instmode = json.instmode;
      this._stan = json.stan;
      this._rrn = json.rrn;
      this._time = json.time;
      this._print = json.print;
      this._track2 = json.track2;
      this._aid = json.aid;
      this._cardholder = json.cardholder;
      this._prefname = json.prefname;
      this._errcode = json.errcode;
      this.errmsg = json.errmsg;
      this._label = json.label;
     
      return json;
    }
  
    getVersion(){
        return this._version ? this._version: '';
    }
    setVersion(version){
        this._version = version;  
    }
    getStatus(){
        return this._status ? this._status: "";
    }
    setStatus(status){
        this._status= status;

    }
    getConfig(){
        return this._config ? this._config: "";
    }
    setConfig(config) {
        this._config = config;
    }
    
    getLicens (){
        return this._license ? this._license: "";
      }
    
     setLicense( license) {
        this._license = license;
      }
    
      getTerminal(){
        return this._terminal ? this._terminal: "";
      }
    
     setTerminal( terminal) {
        this._terminal = terminal;
      }
    
      getMerchant(){
        return this._merchant ? this._merchant: "";
      }
    
     setMerchant( merchant) {
        this._merchant = merchant;
      }
    
      getId (){
       return this._id ? this._id: "";
      }
    
     setId( id) {
        this._id = id;
      }
    
      getType() {
        return this._type ? this._type: "";
      }
    
     setType( type) {
        this._type = type;
      }
    
      getProduct() {
        return this._product ? this._product: "";
      }
    
     setProduct( product) {
        this._product = product;
      }
    
      getResponse(){
        return this._response ? this._response: "";
      }
    
     setResponse( response) {
        this._response = response;
      }
    
      getAuthorization(){
        return this._authorization ? this._authorization: "";
      }
    
     setAuthorization( authorization) {
        this._authorization = authorization;
      }
    
      getAmount (){
        return this._amount ? this._amount: "";
      }
    
     setAmount( amount) {
        this._amount = amount;
      }
    
      getInstallments(){
        return this._installments ? this._installments: "";
      }
    
     setInstallments( installments) {
        this._installments = installments;
      }
    
      getInstmode(){
        return this._instmode ? this._instmode: "";
      }
    
     setInstmode( instmode) {
        this._instmode = instmode;
      }
    
      getStan() {
        return this._stan ? this._stan: "";
      }
    
     setStan( stan) {
        this._stan = stan;
      }
    
      getRrn(){
        return this._rrn ? this._rrn: "";
      }
    
     setRrn( rrn) {
        this._rrn = rrn;
      }
    
      getTime (){
        return this._time ? this._time: "";
      }
    
     setTime( time) {
        this._time = time;
      }
    
      getPrint (){
        return this._print ? this._print: "";
      }
    
     setPrint( print) {
        this._print = print;
      }
    
      getTrack2 (){
        return this._track2 ? this._track2: "";
      }
    
     setTrack2( track2) {
        this._track2 = track2;
      }
    
      getAid() {
        return this._aid ? this._aid: "";
      }
    
     setAid( aid) {
        this._aid = aid;
      }
    
      getCardholder(){
        return this._cardholder ? this._cardholder: "";
      }
    
     setCardholder( cardholder) {
        this._cardholder = cardholder;
      }
    
      getPrefname() {
        return this._prefname ? this._prefname: "";
      }
    
     setPrefname( prefname) {
        this._prefname = prefname;
      }
    
      getErrcode() {
        return this._errcode ? this._errcode: "";
      }
    
     setErrcode( errcode) {
        this._errcode = errcode;
      }
    
      getErrmsg (){
        return this.errmsg ? this.errmsg: "";
      }
    
     setErrmsg( errmsg) {
        this.errmsg = errmsg;
      }
    
      getLabel() {
        return this._label ? this._label: "";
      }
    
     setLabel(label) {
        this._label = label;
      }

}
