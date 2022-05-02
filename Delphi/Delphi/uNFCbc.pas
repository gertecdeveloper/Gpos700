unit uNFCbc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation,

  // JavaInterfaces,
  Androidapi.Helpers,
  G700NFC
  ;

type
  TfrmNFCbc = class(TForm)
    lblMensagem: TLabel;
    btnIdCartao: TButton;
    Timer1: TTimer;

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIdCartaoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure mensagemAproximeCartao;
    procedure mensagemEscolhaOpcao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNFCbc: TfrmNFCbc;
  GertecNFC : TG700NFC;
implementation

{$R *.fmx}


procedure TfrmNFCbc.mensagemAproximeCartao;
begin
  lblMensagem.text := 'Aproxime o cartão';
end;

procedure TfrmNFCbc.mensagemEscolhaOpcao;
begin
  lblMensagem.text := 'Escolha uma opção';
end;

procedure TfrmNFCbc.btnIdCartaoClick(Sender: TObject);
begin
  mensagemAproximeCartao;
  GertecNFC.setLeituraID;
  Timer1.Enabled := true;
end;


procedure TfrmNFCbc.FormActivate(Sender: TObject);
begin

  if(GertecNFC = nil)then begin
    GertecNFC := TG700NFC.Create();
    GertecNFC.setLeituraID;
  end;

  //EnableForegroundDispatch
  GertecNFC.PowerOn;

  mensagemEscolhaOpcao;


end;


procedure TfrmNFCbc.FormCreate(Sender: TObject);
begin
//G700NFC := TG700NFC.Create(lblMensagem);
end;

procedure TfrmNFCbc.Timer1Timer(Sender: TObject);
var
  lValid   : Boolean;
  idCartao : String;
  i,idxCartao:integer;
begin
  Timer1.Enabled := False;
  idCartao := GertecNFC.retornaIdCartao;

  if( not idCartao.IsEmpty) then begin
    ShowMessage('ID do cartão   : ' + GertecNFC.retornaIdCartao+#13#10'ID do cartão(Hex): ' + GertecNFC.retornaIdCartaoHex+#13#10);
    GertecNFC.LimpaIdCartao;
    mensagemEscolhaOpcao;
  end else begin
    Timer1.Enabled := True;
  end;

end;

end.

