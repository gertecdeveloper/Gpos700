unit GER7TEF;

interface

uses


  System.SysUtils;          //Required


type

  TGER7TEF = Class
    public
        response:integer;

        Authorization:string; //Codigo de Autorizacao(*)
        IDTransacao,        //Identificador da transação(*)
        ProdutoSelecionado,      //Tipo da Transacao
        LabelTransacao,     //Bandeira(*)
        STAN,         //STAN(*) DOC do Cupom
        RRN,          //RRN(*)  REF do Cupom
        Horario,   //Horario
        Versao,       //Versao
        Status,
        License,
        Terminal,
        Merchant,
        Config,
        AID,              //AID(*)
        Parcelas,         //Parcelas(*)
        TipoParcela, //Tipo Parcelamento(*)
        Valor,            //Valor(*)
        NomePortador,     //Nome do Portador(*)
        Trilha1,          //Trilha1(*)
        Trilha2,          //Trilha2(*)
        Trilha3,          //Trilha3(*)
        textoImpressoEc,
        textoImpressoCliente,
        //Versao RC04
        cardholder,
        prefname,
        authorizationType,
        cardEntry,
        cvm,
        acquirer,
        pan,
        //Versao RC05
        Tipo,
        Amount,
        apiversion



        :string;

        ErrorCode,
        ErrorMsg:string;

        constructor Create;overload;
        constructor Create(strApiVersion:string);overload;
        procedure Zera;

        function getApiVersion : String;
        function getPos7Version : String;
        function getTerminalId : String;
        function getMerchantId : String;
        function getResType : String;
        function getResProduct : String;
        function getResponse : String;
        function getResAuthorization : String;
        function getResAmount : String;
        function getResStan : String;
        function getResRrn : String;
        function getResTime : String;
        function getResErrorCode : String;


  End;

implementation
//**********************************************
constructor TGER7TEF.Create;

 begin
 Create('');
 end;
//**********************************************
constructor TGER7TEF.Create(strApiVersion:string);

 begin

 Zera;
 apiversion := strApiVersion;
 end;
//**********************************************

procedure TGER7TEF.Zera;
begin
        Authorization:='';
        IDTransacao:='';
        ProdutoSelecionado:='';
        LabelTransacao:='';
        STAN:='';
        RRN:='';
        Horario:='';
        Versao:='';
        Status:='';
        License:='';
        Terminal:='';
        Merchant:='';
        Config:='';
        AID:='';
        Parcelas:='';
        TipoParcela:='';
        Valor:='';
        NomePortador:='';
        Trilha1:='';
        Trilha2:='';
        Trilha3:='';
        textoImpressoEc:='';
        textoImpressoCliente:='';
        ErrorCode:='';
        ErrorMsg:='';

        //RC04
        //Versao RC04
        cardholder:='';
        prefname:='';
        authorizationType:='';
        cardEntry:='';
        cvm:='';
        acquirer:='';
        pan:='';
        Tipo:='';
        Amount:='';


end;
//**********************************************
        function TGER7TEF.getApiVersion : String;
        begin
        result := Apiversion;
        end;
//==============================================
        function TGER7TEF.getPos7Version : String;
        begin
        result := Versao;
        end;
//==============================================
        function TGER7TEF.getTerminalId : String;
        begin
        result := Terminal;
        end;
//==============================================
        function TGER7TEF.getMerchantId : String;
        begin
        result := Merchant;
        end;
//==============================================
        function TGER7TEF.getResType : String;
        begin
        result := Tipo;
        end;
//==============================================
        function TGER7TEF.getResProduct : String;
        begin
        result := ProdutoSelecionado;
        end;
//==============================================
        function TGER7TEF.getResponse : String;
        begin
        result := IntToStr(response);
        end;
//==============================================
        function TGER7TEF.getResAuthorization : String;
        begin
        result := Authorization;
        end;
//==============================================
        function TGER7TEF.getResAmount : String;
        begin
        result := Amount;
        end;
//==============================================
        function TGER7TEF.getResStan : String;
        begin
        result := STAN;
        end;
//==============================================
        function TGER7TEF.getResRrn : String;
        begin
        result := RRN;
        end;
//==============================================
        function TGER7TEF.getResTime : String;
        begin
        result := Horario;
        end;
//==============================================
        function TGER7TEF.getResErrorCode : String;
        begin
        result := ErrorCode;
        end;

end.
