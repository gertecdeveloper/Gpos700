using System;

namespace GertecXamarinForms.Droid.TEF
{
    public class OperacaoRetorno
    {
        public string version;
        public string status;
        public string config;
        public string license;
        public string terminal;
        public string merchant;
        public string id;
        public string type;
        public string product;
        public string response;
        public string authorization;
        public string amount;
        public string installments;
        public string instmode;
        public string stan;
        public string rrn;
        public string time;
        public string print;
        public string track2;
        public string aid;
        public string cardholder;
        public string prefname;
        public string errcode;
        public string errmsg;
        public string label;

        public string getVersion()
        {
            return version;
        }

        public void setVersion(string version)
        {
            this.version = version;
        }

        public string getStatus()
        {
            return status;
        }

        public void setStatus(string status)
        {
            this.status = status;
        }

        public string getConfig()
        {
            return config;
        }

        public void setConfig(string config)
        {
            this.config = config;
        }

        public string getLicense()
        {
            return license;
        }

        public void setLicense(string license)
        {
            this.license = license;
        }

        public string getTerminal()
        {
            return terminal;
        }

        public void setTerminal(string terminal)
        {
            this.terminal = terminal;
        }

        public string getMerchant()
        {
            return merchant;
        }

        public void setMerchant(string merchant)
        {
            this.merchant = merchant;
        }

        public string getId()
        {
            return id;
        }

        public void setId(string id)
        {
            this.id = id;
        }

        public string getType()
        {
            return type;
        }

        public void setType(string type)
        {
            this.type = type;
        }

        public string getProduct()
        {
            return product;
        }

        public void setProduct(string product)
        {
            this.product = product;
        }

        public string getResponse()
        {
            return response;
        }

        public void setResponse(string response)
        {
            this.response = response;
        }

        public string getAuthorization()
        {
            return authorization;
        }

        public void setAuthorization(string authorization)
        {
            this.authorization = authorization;
        }

        public string getAmount()
        {
            return amount;
        }

        public void setAmount(string amount)
        {
            this.amount = amount;
        }

        public string getInstallments()
        {
            return installments;
        }

        public void setInstallments(string installments)
        {
            this.installments = installments;
        }

        public string getInstmode()
        {
            return instmode;
        }

        public void setInstmode(string instmode)
        {
            this.instmode = instmode;
        }

        public string getStan()
        {
            return stan;
        }

        public void setStan(string stan)
        {
            this.stan = stan;
        }

        public string getRrn()
        {
            return rrn;
        }

        public void setRrn(string rrn)
        {
            this.rrn = rrn;
        }

        public string getTime()
        {
            return time;
        }

        public void setTime(string time)
        {
            this.time = time;
        }

        public string getPrint()
        {
            return print;
        }

        public void setPrint(string print)
        {
            this.print = print;
        }

        public string getTrack2()
        {
            return track2;
        }

        public void setTrack2(string track2)
        {
            this.track2 = track2;
        }

        public string getAid()
        {
            return aid;
        }

        public void setAid(string aid)
        {
            this.aid = aid;
        }

        public string getCardholder()
        {
            return cardholder;
        }

        public void setCardholder(string cardholder)
        {
            this.cardholder = cardholder;
        }

        public string getPrefname()
        {
            return prefname;
        }

        public void setPrefname(string prefname)
        {
            this.prefname = prefname;
        }

        public string getErrcode()
        {
            return errcode;
        }

        public void setErrcode(string errcode)
        {
            this.errcode = errcode;
        }

        public string getErrmsg()
        {
            return errmsg;
        }

        public void setErrmsg(string errmsg)
        {
            this.errmsg = errmsg;
        }

        public string getLabel()
        {
            return label;
        }

        public void setLabel(string label)
        {
            this.label = label;
        }


    }

    public class RetornoMsiTef
    {
        public string CODRESP;
        public string COMP_DADOS_CONF;
        public string CODTRANS;
        public string VLTROCO;
        public string REDE_AUT;
        public string BANDEIRA;
        public string NSU_SITEF;
        public string NSU_HOST;
        public string COD_AUTORIZACAO;
        public string TIPO_PARC;
        public string NUM_PARC;
        public string VIA_ESTABELECIMENTO;
        public string VIA_CLIENTE;

        public string getNSUHOST()
        {
            return this.NSU_HOST;
        }
        public string getSitefTipoParcela()
        {
            return this.TIPO_PARC;
        }
        public string getNSUSitef()
        {
            return this.NSU_SITEF;
        }
        public string getCodTrans()
        {
            return this.CODTRANS;
        }
        public void setCodTrans(string _cODTRANS)
        {
            this.CODTRANS = _cODTRANS;
        }
        public string getNameTransCod()
        {
            string retorno = "Valor invalido";
            switch (this.TIPO_PARC)
            {
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

        public string getvlTroco()
        {
            return this.VLTROCO;
        }
        public string getParcelas()
        {
            if (this.NUM_PARC != null)
            {
                return this.NUM_PARC;
            }
            return "";
        }

        public string getCodAutorizacao()
        {
            return this.COD_AUTORIZACAO;
        }
        public string textoImpressoEstabelecimento()
        {
            return this.VIA_ESTABELECIMENTO;
        }
        public string textoImpressoCliente() { return this.VIA_CLIENTE; }
        public string getCompDadosConf() { return this.COMP_DADOS_CONF; }
        public string getCodResp() { return this.CODRESP; }
        public string getRedeAut() { return this.REDE_AUT; }
        public string getBandeira() { return this.BANDEIRA; }


    }

}