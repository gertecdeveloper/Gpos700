unit Unit1;

interface

//Para definir a opção de implementação, Desabilte TTask, irá utilizar TTimer
{$DEFINE __TTASK__}



uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.DialogService,


  System.IOUtils,
  System.Character,
  System.Generics.Collections,
  System.UIConsts, FMX.Edit,
  FMX.EditBox, FMX.NumberBox,
  System.Threading,


  Androidapi.Helpers,
  G700Interface,
  GEDIPrinter,
  GER7TEF,
  FMX.Surfaces;
const

  NORMAL = false;
  BOLD = true;

  GER7_VENDA = '1';
  GER7_CANCELAMENTO = '2';
  GER7_FUNCOES = '3';

  GER7_DESABILITA_IMPRESSAO = '0';
  GER7_HABILITA_IMPRESSAO = '1';

  GER7_CREDITO = '1';
  GER7_DEBITO = '2';
  GER7_VOUCHER = '4';

  GER7_SEMPARCELAMENTO = '0';
  GER7_PARCELADO_LOJA = '1';
  GER7_PARCELADO_ADM = '2';

type

  TForm1 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    rdgProdutos: TRadioButton;
    rdgDebito: TRadioButton;
    grpParcelamento: TGroupBox;
    rdgParceladoLoja: TRadioButton;
    rdgParceladoAdm: TRadioButton;
    cmdEnviarTransacao: TButton;
    rdgVoucher: TRadioButton;
    cmdCancelarTransacao: TButton;
    cmdFuncoes: TButton;
    edtParcelas: TNumberBox;
    Label2: TLabel;
    chkImpressao: TCheckBox;
    edtValor: TEdit;
    lblTitulo: TLabel;


    procedure cmdEnviarTransacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtParcelasKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure cmdCancelarTransacaoClick(Sender: TObject);
    procedure cmdFuncoesClick(Sender: TObject);
    {$IFNDEF __TTASK__}
    procedure timerTEFTimer(Sender: TObject);
    {$ENDIF}
    procedure fExecuteTEF(Tipo,Id,Amount,Parcelas,TipoParcelamento,Product,HabilitaImpressao:string);

    procedure cmdEnviarTransacaoKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure RandomValor;

  private
    { Private declarations }

    {$IFDEF __TTASK__}
    bTask:ITask;
    {$ELSE}
    timerTEF:TTimer;
    {$ENDIF}
  public
    { Public declarations }
  end;



var
  Form1: TForm1;
implementation

{$R *.fmx}

//**********************************************
function Numeric(strValor:string):string;
//Devolve somente caracteres numericos da String
//Ex: 1,23=>123
//Ex:1,2 =>120
var
i,iPos:integer;
ch:char;
strResult:string;
begin
  iPos:=Pos(',',strValor);
  iPos:=length(strValor)-iPos;
  case iPos of
    0:strValor:=strValor+'00';
    1:strValor:=strValor+'0';
  end;

  strResult:='';
  for i := 0 to Length(strValor)-1 do begin
    ch:= strValor[i];
    if(ch>='0')and(ch<='9')then
      strResult:=strResult+ch;
  end;
  Result:=strResult;
end;

//**********************************************
procedure TForm1.edtParcelasKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
grpParcelamento.Enabled := (StrToIntDef(edtParcelas.Text,0)>1);
end;
//**********************************************
procedure TForm1.FormCreate(Sender: TObject);
begin

{$IFDEF __TTASK__}
lblTitulo.text := 'Delphi '+getVersion+' (TTask)';
{$ELSE}
lblTitulo.text := 'Delphi '+getVersion+' (TTimer)';

timerTEF:= TTimer.Create(Form1);
timerTEF.Interval:=1;
timerTEF.OnTimer:=timerTEFTimer;
timerTEF.Enabled:=False;
{$ENDIF}

Randomize;
RandomValor;




end;
//**********************************************
procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True; // Requires D2006 or newer.
   ListOfStrings.DelimitedText   := Str;
end;
//**********************************************
procedure MostraAprovada;
begin

TDialogService.MessageDialog(
        'Transação aprovada!' + #13#10 +
        'Authorization: '+ transacao.Authorization + #13#10 +
        'ID: ' + transacao.IDTransacao + #13#10 +
        'Produto: ' + transacao.ProdutoSelecionado + #13#10 +
        'Label: ' + transacao.LabelTransacao + #13#10 +
        'STAN: ' + transacao.STAN + #13#10 +
        'AID: ' + transacao.AID + #13#10 +
        'RRN: ' + transacao.RRN + #13#10 +
        'Horario: ' + transacao.Horario+ #13#10 +
        'Version: ' + transacao.Versao+#13#10 +
        'Valor: ' + transacao.Valor+#13#10 +
        'Você deseja imprimir os cupons?',

        System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
        System.UITypes.TMsgDlgBtn.mbYes, 0,

      // Use an anonymous method to make sure the acknowledgment appears as expected.
        procedure(const AResult: TModalResult)
        begin
          if(AResult = mrYES)then begin
            PrintStringBold('************[ESTABELECIMENTO]************');
            printCupom(BOLD,transacao.textoImpressoEc);
            PrintString    ('****************[CLIENTE]****************');
            printCupom(BOLD,transacao.textoImpressoCliente);
            printOutput;
          end;

        end);

end;
//************************************************
procedure MostraNegada;
begin

          ShowMessage('Transação negada' + #13#10 +
          'response: ' + inttostr(transacao.response) + #13#10 +
          'Error code: ' + transacao.ErrorCode + #13#10 +
          'Error: ' + transacao.ErrorMsg);
end;

{$IFNDEF __TTASK__}
procedure TForm1.timerTEFTimer(Sender: TObject);
var res:integer;

begin
timerTEF.Enabled:=false;

try
if(TEFExecuteFlag>0)then begin
  res := transacao.response;
  if (res = 0)and(TEFExecuteFlag=1) then
    begin
      MostraAprovada;
    end
    else
    begin
      MostraNegada;
    end;
   TEFExecuteFlag:=0;
   RandomValor;
end else begin
  timerTEF.Enabled:=True;
end;

except
  on e: exception do begin
  ShowMessage('Erro=>'+e.Message);
end;

end;

end;
{$ENDIF}

//************************************************
procedure TForm1.fExecuteTEF(Tipo,Id,Amount,Parcelas,TipoParcelamento,Product,HabilitaImpressao:string);
begin

ExecuteTEF(Tipo,Id,Amount,Parcelas,TipoParcelamento,Product,HabilitaImpressao);
{$IFDEF __TTASK__}

  bTask := TTask.Create(
      procedure
      var res:integer;
      begin

      while TEFExecuteFlag=0 do begin
        sleep(500);
      end;

      res := transacao.response;

      if (res = 0)and(TEFExecuteFlag=1) then begin

        TThread.Synchronize(nil,
        procedure
        begin
          MostraAprovada;
        end);

      end else begin
        TThread.Synchronize(nil,
        procedure
        begin
         MostraNegada;
        end );
      end;
      TEFExecuteFlag:=0;
      RandomValor;

  end);

  bTask.Start;
  {$ELSE}
  timerTEF.Enabled :=true;
  {$ENDIF}

end;
//************************************************
procedure TForm1.cmdEnviarTransacaoClick(Sender: TObject);
var

Produto,
HabilitaImpressao,
Parcelas,TipoParcelamento:String;

begin

try

  if(chkImpressao.IsChecked)then
    HabilitaImpressao:=GER7_HABILITA_IMPRESSAO
  else
    HabilitaImpressao:=GER7_DESABILITA_IMPRESSAO;

  if rdgProdutos.IsChecked then begin
    Produto:=GER7_CREDITO
  end else if rdgDebito.IsChecked then begin
    Produto:=GER7_DEBITO
  end else if rdgVoucher.IsChecked then begin
    Produto:=GER7_VOUCHER
  end;


  Parcelas:= IntToStr(StrToIntDef(edtParcelas.Text,0));


  if((Parcelas='0')or(Parcelas='1'))then begin
    TipoParcelamento :=GER7_SEMPARCELAMENTO;
  end else begin
    if rdgParceladoLoja.IsChecked then begin
      TipoParcelamento :=GER7_PARCELADO_LOJA;
    end else if rdgParceladoAdm.IsChecked then begin
      TipoParcelamento :=GER7_PARCELADO_ADM;
    end;
  end;

//DESCOMENTAR SE FOR HABILITAR DEBUG
//  if(transacao = nil) then begin
//    transacao:= TGER7TEF.Create;
//  end;
//  transacao.SetaDebug(true);

  fExecuteTEF(GER7_VENDA,'123456',Numeric(edtValor.text),Parcelas,TipoParcelamento,Produto,HabilitaImpressao);

except
  on e: exception do begin
  ShowMessage('Erro=>'+e.Message);
end;

end;

end;
//**********************************************
procedure TForm1.cmdEnviarTransacaoKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if(TEFExecuteFlag>0)then
  Key:=0; //Desabiltar Back Button da API GER7
end;

//**********************************************
procedure TForm1.cmdCancelarTransacaoClick(Sender: TObject);
var
    HabilitaImpressao:string;

begin
try
  if(chkImpressao.IsChecked)then
    HabilitaImpressao:=GER7_HABILITA_IMPRESSAO
  else
    HabilitaImpressao:=GER7_DESABILITA_IMPRESSAO;

    fExecuteTEF(GER7_CANCELAMENTO,'123456','','','','',HabilitaImpressao);
  except
    on e: exception do begin
    ShowMessage('ErroTr=>'+e.Message);
  end;

  end;

end;
//**********************************************
procedure TForm1.cmdFuncoesClick(Sender: TObject);
begin
  try
    fExecuteTEF(GER7_FUNCOES,'123456','','','','','1');

  except
    on e: exception do begin
    ShowMessage('ErroTr=>'+e.Message);
  end;

end;

end;
//************************************************
procedure TForm1.RandomValor;
var strAux:string;
    i:integer;
begin
for i := 1 to 3 do begin
    strAux:=strAux+chr(48+random(10));
    if(i=1)then strAux:=strAux+',';
end;
edtValor.text := strAux;

end;
//************************************************
end.
