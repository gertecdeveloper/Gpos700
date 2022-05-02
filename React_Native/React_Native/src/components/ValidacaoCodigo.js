const maxLenght = 32;
const minLenght = 8;

export default class ValidacaoCodigo{
    getValidation(cnpj){
        if(cnpj.length >= minLenght && cnpj.length <= maxLenght){
            return true;
        }else{
            return false;
        }
    }
}