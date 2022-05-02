export default class RetornoMsiTef{
  fromJsonMsiTef(json){
    // json = JSON.parse(json)
    this._cODRESP = json.CODRESP;
    this._cOMPDADOSCONF = json.COMP_DADOS_CONF;
    this._cODTRANS = json.CODTRANS;
    this._vLTROCO = json.VLTROCO;
    this._rEDEAUT = json.REDE_AUT;
    this._bANDEIRA = json.BANDEIRA;
    this._nSUSITEF = json.NSU_SITEF;
    this._nSUHOST = json.NSU_HOST;
    this._cODAUTORIZACAO = json.COD_AUTORIZACAO;
    this._tipoPARC = json.TIPO_PARC;
    this._numPARC = json.NUM_PARC;
    this._viaCLIENTE = json.VIA_CLIENTE;
    this._viaESTABELECIMENTO = json.VIA_ESTABELECIMENTO;
    return json;

  }
  
 getNSUHOST (){
    return this._nSUHOST
  }
 getSitefTipoParcela(){
    return this._tipoPARC
  }
 getNSUSitef(){
    return this._nSUSITEF
  }
 getCodTrans (){
 
    return  this._cODTRANS? this._cODTRANS: '';  
  } 
  setCodTrans (_cODTRANS){
 
    this._cODTRANS= _cODTRANS;  
  } 
 getNameTransCod (){
    retorno = "Valor invalido";
    switch (parseInt(this._tipoPARC)) {
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

 getvlTroco (){
    return this._vLTROCO;
  } 
 getParcelas (){
    if (this._numPARC != null) {
      return this._numPARC;
    }
    return "";
  }

 getCodAutorizacao (){
    return this._cODAUTORIZACAO ? this._cODAUTORIZACAO: "";
  }
 textoImpressoEstabelecimento ()
  {
    return this._viaESTABELECIMENTO ? this._viaESTABELECIMENTO: "";
  }
 textoImpressoCliente () { return this._viaCLIENTE ? this._viaCLIENTE: "";}
 getCompDadosConf (){return this._cOMPDADOSCONF ? this._cOMPDADOSCONF: "";}
 getCodResp (){return this._cODRESP ? this._cODRESP: "";}
 getRedeAut (){return this._rEDEAUT ? this._rEDEAUT: "";}
 getBandeira (){return this._bANDEIRA ? this._bANDEIRA: "";}
}


