
export default class Venda{
  // transforma os parametros venda em string para o retorno
  toJson(){
    let data=
        {
            'amount': this.getAmount(), 'apiversion':this.getApiversion(),'id':this.getId(), 
            "installments": this.getInstallments(),
            'instmode':this.getInstmode(), 'product':this.getProduct(),
            'receipt':this.getReceipt(), 'type':this.getType() 
        }
      return JSON.stringify(data).toString()

    }
    getType() {
        return this._type;
      }
    
    setType(type) {
        this._type = type;
    }
    
    getId() {
        return this._id;
      }
    
   setId(id) {
        this._id = id;
      }
    
    getAmount (){
        return this._amount;
      }
    
   setAmount( amount) {
        this._amount = amount;
      }
    
    getInstallments() {
        return this._installments;
      }
    
   setInstallments(installments) {
        this._installments = installments;
      }
    
    getInstmode() {
        return this._instmode;
      }
    
   setInstmode(instmode) {
        this._instmode = instmode;
      }
    
    getProduct() {
        return this._product;
      }
    
   setProduct(product) {
        this._product = product;
      }
    
    getReceipt() {
        return this._receipt;
      }
    
   setReceipt( receipt) {
        this._receipt = receipt;
      }
    
    getApiversion() {
        return this._apiversion;
      }
    
   setApiversion(apiversion) {
        this._apiversion = apiversion;
      }


}

