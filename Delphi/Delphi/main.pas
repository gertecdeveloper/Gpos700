unit main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Colors,

  Androidapi.Jni.Net,       //Required
  Androidapi.JNI.JavaTypes, //Required
  Androidapi.Helpers,       //Required
  Androidapi.JNI.GraphicsContentViewText, //Required
  Androidapi.JNI.App,       //Required
  System.Messaging,         //Required
  System.JSON,               //Required
  Androidapi.JNI.OS,        //Required

  //
  System.IOUtils,

  //Units do projeto
  CodigoDeBarraV2,
  CodigoDeBarras,
  ImpressaoG,
 //Unit2,
  //Unit3,

  TEF,
  //GerSat,

  {$IFDEF __G800__}
  uNFC,

  FMX.Ani,
  FMX.Layouts,
  FMX.ExtCtrls,

  Impressao_G800,
  CodigoDeBarras_G800,
  CodigoDeBarraV2_G800,
  NFC_G800

  {$ELSE}

  G700NFC,
  uNFCid,
  FMX.Ani,
  FMX.Layouts,
  FMX.ExtCtrls,

  System.Tether.Manager,
  System.Tether.AppProfile,
  System.Actions,

  Androidapi.JNI.Toast,

  FMX.ActnList,
  FMX.StdActns,
  FMX.MediaLibrary.Actions,
  FMX.Media,
  FMX.Platform,

  ZXing.BarcodeFormat,
  ZXing.ReadResult,
  ZXing.ScanManager,
  FMX.Barcode.DROID, FMX.Edit, IPPeerClient, IPPeerServer


  {$ENDIF}

  ;

type

TBarCodes = (QRCODE);


  TfrmMain = class(TForm)
    cmdImpressao: TColorButton;
    Label1: TLabel;
    Image3: TImage;
    cmdCodigoBarras: TColorButton;
    Label2: TLabel;
    Image1: TImage;
    cmdNFC: TColorButton;
    Label3: TLabel;
    Image2: TImage;
    cmdNFCGedi: TColorButton;
    Label4: TLabel;
    Image4: TImage;
    ImageControl1: TImageControl;
    Label5: TLabel;
    cmdCodBarraV2: TColorButton;
    Label6: TLabel;
    cmdNFCId: TColorButton;
    lblINFCbc: TLabel;
    Image6: TImage;

    Image7: TImage;
    cmdTef: TColorButton;
    Label7: TLabel;
    Image5: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    VertScrollBox1: TVertScrollBox;
    cmdGerSat: TColorButton;
    Image8: TImage;
    lblGerSat: TLabel;

    procedure cmdCodigoBarrasClick(Sender: TObject);
    procedure cmdImpressaoClick(Sender: TObject);
    procedure cmdNFCClick(Sender: TObject);
    procedure cmdCodBarraV2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdNFCGediClick(Sender: TObject);
    procedure cmdNFCIdClick(Sender: TObject);   //32165465
    procedure cmdTefClick(Sender: TObject);
    procedure DesligaNFC;

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
implementation

{$R *.fmx}


procedure TfrmMain.cmdCodigoBarrasClick(Sender: TObject);
begin
DesligaNFC;

{$IFDEF __G800__}

  if (frmCodBarras_G800.getAtivoCamera = True) then
  begin
     frmCodBarras_G800.iniciaBarCode(False);
  end else begin
     frmCodBarras_G800.iniciaBarCode(True);
  end;

  frmCodBarras_G800.Show;

{$ELSE}

  if (frmCodBarra.getAtivoCamera = True) then
  begin
     frmCodBarra.iniciaBarCode(False);
  end else begin
     frmCodBarra.iniciaBarCode(True);
  end;

  frmCodBarra.Show;

{$ENDIF}

end;

procedure TfrmMain.cmdCodBarraV2Click(Sender: TObject);
begin
DesligaNFC;

{$IFDEF __G800__}

  if frmCodBarraV2_G800.getOKCamera then
  begin
    frmCodBarraV2_G800.iniciaBarCodeV2(True);
  end else begin
    frmCodBarraV2_G800.iniciaBarCodeV2(False);
  end;

  frmCodBarraV2_G800.Show;

{$ELSE}

  if frmCodigoBarraV2.getOKCamera = True then
  begin
    frmCodigoBarraV2.iniciaBarCodeV2(False);
  end;

  frmCodigoBarraV2.Show;

{$ENDIF}
end;

procedure TfrmMain.DesligaNFC;
begin
{$IFNDEF __G800__}
if(GertecNFC <> nil)then
  GertecNFC.PowerOff;
{$ENDIF}
end;

procedure TfrmMain.cmdImpressaoClick(Sender: TObject);
begin
DesligaNFC;

//ShowMessage('Impressao');

{$IFDEF __G800__}
  frmImpressaoG800.PanelMessage.Visible:=False;
  frmImpressaoG800.CleanText(True);
  frmImpressaoG800.Show;

{$ELSE}

  frmImpressaoG.PanelMessage.Visible:=False;
  frmImpressaoG.CleanText(True);
  frmImpressaoG.Show;

{$ENDIF}

end;

procedure TfrmMain.cmdNFCClick(Sender: TObject);
begin
//ShowMessage('NFC');
{$IFDEF __G800__}
//frmNFC.Show;
if frmNfcG800.getLigado = 0 then
begin
  frmNfcG800.iniciaNFC(False);
end else
begin
  frmNfcG800.iniciaNFC(True);
end;

frmNfcG800.Show;
{$ENDIF}
end;

procedure TfrmMain.cmdNFCGediClick(Sender: TObject);   //1365465
begin
{$IFNDEF __G800__}
frmNFCid.setNfcModo(False);
frmNFCid.Show;
{$ENDIF}
end;

procedure TfrmMain.cmdTefClick(Sender: TObject);
begin
DesligaNFC;
{$IFNDEF __G800__}
  frmTEF.CleanTextTEF(TRUE);
  frmTEF.Show;
{$ENDIF}
end;

procedure TfrmMain.cmdNFCIdClick(Sender: TObject);
begin
{$IFNDEF __G800__}
frmNFCid.setNfcModo(True);
frmNFCid.Show;
{$ENDIF}
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
DeviceType :string;
begin

  DesligaNFC;
  DeviceType := JStringToString(TJBuild.JavaClass.MODEL);


  if(DeviceType = 'Smart G800')then begin
    //ShowMessage('Smart G800');

    cmdNFC.Visible := True;
    cmdNFCId.Visible := False;

    cmdNFC.Position.Y := cmdNFCId.Position.Y;


  end else begin//'GPOS700'
    //ShowMessage('NOT Smart G800');
    cmdNFC.Visible := False;
    cmdGerSat.Position.Y := cmdTef.Position.Y;
    cmdTef.Position.Y := cmdNFCGedi.Position.Y;
    cmdNFCGedi.Position.Y := cmdNFC.Position.Y;

  end;
  cmdNFCId.Visible := not cmdNFC.Visible;

end;


end.


