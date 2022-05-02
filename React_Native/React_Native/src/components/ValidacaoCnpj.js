const cnpjLenght = 14;

export default class ValidacaoCnpj{
    getClean(cnpj){
        cnpj_limpo = cnpj.split('.').join('').split('/').join('').split('-').join('');

        return cnpj_limpo;
    }

    getSize(cnpj){
        if(cnpj.length != cnpjLenght){
            return true;
        }else{
            return false;
        }
    }
}