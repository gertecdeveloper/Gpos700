unit CodigoDeBarraV2;

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
  IPPeerClient,
  IPPeerServer,
  System.Tether.Manager,
  System.Tether.AppProfile,
  System.Actions,
  Androidapi.JNI.Toast,
  FMX.ActnList,
  FMX.StdActns,
  FMX.MediaLibrary.Actions,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Media,
  FMX.Layouts,
  FMX.ExtCtrls,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Platform,
  ZXing.BarcodeFormat,
  ZXing.ReadResult,
  ZXing.ScanManager,
  FMX.Barcode.DROID, FMX.Objects, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.IOUtils, FMX.Colors;

const
  SECOND = 1/86400;

type

TBarCodes = (EAN8, EAN13, QRCODE, AUTO);

  TfrmCodigoBarraV2 = class(TForm)
    ActionList1: TActionList;
    Camera: TCameraComponent;
    ShowShareSheetAction1: TShowShareSheetAction;
    TetheringAppProfile1: TTetheringAppProfile;
    imgCamera: TImage;
    lblResultadoLeitura: TEdit;
    Label1: TLabel;
    txtLeitura: TLabel;
    ListView1: TListView;
    PanelMessage: TPanel;
    btnOK: TButton;
    lblMsg: TLabel;
    lblMsgCode: TLabel;
    MediaPlayer1: TMediaPlayer;
    ColorButton1: TColorButton;
    lblFlash: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CameraSampleBufferReady(Sender: TObject; const ATime: TMediaTime);

    procedure btnOKClick(Sender: TObject);
    procedure ColorButton1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
     { Private declarations }

    // for the external library
    fInProgress: boolean;
    fFMXBarcode: TFMXBarcode;

    // for the native zxing.delphi library
    fScanManager: TScanManager;
    fScanInProgress: Boolean;
    fFrameTake: Integer;

    procedure GetImage();
    function AppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;

    procedure AtivaLeitura(tipo : TBarcodeFormat);
    procedure FinalizaLeitura;

    procedure ativaFlash();


  public
    { Public declarations }
     function getOKCamera(): Boolean;
     procedure iniciaBarCodeV2(pauseCamera: Boolean);
     procedure beepSound(ResourceID: string);
     function RetornaFormato(barcode: TBarcodeFormat):string;

  end;

var
  frmCodigoBarraV2: TfrmCodigoBarraV2;
  ok: Boolean;

implementation

{$R *.fmx}


uses System.Threading;

var lFlash : Boolean;
    iCount:integer;
    UltimoCodigo:string;
    UltimaHora:TDateTime;

//***********************************************************
function TfrmCodigoBarraV2.AppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  Result := False;
  case AAppEvent of
    TApplicationEvent.WillBecomeInactive, TApplicationEvent.EnteredBackground,
      TApplicationEvent.WillTerminate:
      begin
        Camera.Active := False;
        Result := True;
      end;
  end;
end;
function TfrmCodigoBarraV2.getOKCamera(): Boolean;
 begin
    Result := ok;
 end;
//***********************************************************
procedure TfrmCodigoBarraV2.iniciaBarCodeV2(pauseCamera: Boolean);
begin
  if pauseCamera then
  begin

  end else begin
    ListView1.Items.Clear;
    PanelMessage.Visible:=False;
    AtivaLeitura(TBarcodeFormat.Auto);
  end;
end;
//***********************************************************
procedure TfrmCodigoBarraV2.ativaFlash();
begin
  if Camera.HasTorch then
    begin
      if lFlash then
        begin
          Camera.TorchMode := FMX.Media.TTorchMode.ModeOff;
          lblFlash.Text := 'Ligar Flash';
          lFlash := False;
        end
      else
        begin
          Camera.TorchMode := FMX.Media.TTorchMode.ModeOn;
          lblFlash.Text := 'Desligar Flash';
          lFlash := True;
        end;
    end
  else
    Toast('Não existe FLASH neste aparelho!');

end;
procedure TfrmCodigoBarraV2.Label2Click(Sender: TObject);
begin
  ativaFlash;
end;
procedure TfrmCodigoBarraV2.ColorButton1Click(Sender: TObject);
begin
   ativaFlash;
end;
//***********************************************************
procedure TfrmCodigoBarraV2.beepSound(ResourceID: string);
var
  ResStream: TResourceStream;
  TmpFile: string;
begin
      ResStream := TResourceStream.Create(HInstance, ResourceID, RT_RCDATA);
      try

        TmpFile := TPath.Combine(TPath.GetDocumentsPath, 'Bleep.mp3');

        ResStream.Position := 0;
        ResStream.SaveToFile(TmpFile);

        MediaPlayer1.FileName := TmpFile;
        MediaPlayer1.Play;

      finally
        ResStream.Free;
      end;


      MediaPlayer1.Play;

end;
//***********************************************************
function TfrmCodigoBarraV2.RetornaFormato(barcode: TBarcodeFormat):string;
begin
  case barcode of
    TBarcodeFormat.EAN_8 : result :='EAN8';
    TBarcodeFormat.EAN_13 : result :='EAN13';
    TBarcodeFormat.QR_CODE: result :='QRCode';
    TBarcodeFormat.AZTEC: result := 'AZTEC';
    TBarcodeFormat.CODABAR: result := 'CODABAR';
    TBarcodeFormat.CODE_39: result := 'CODE_39';
    TBarcodeFormat.CODE_93: result := 'CODE_93';
    TBarcodeFormat.CODE_128: result := 'CODE_128';
    TBarcodeFormat.DATA_MATRIX: result := 'DATA_MATRIX';
    TBarcodeFormat.ITF: result := 'ITF';
    TBarcodeFormat.MAXICODE: result := 'MAXICODE';
    TBarcodeFormat.PDF_417: result := 'PDF_417';
    TBarcodeFormat.RSS_14: result := 'RSS_14';
    TBarcodeFormat.RSS_EXPANDED: result := 'RSS_EXPANED';
    TBarcodeFormat.UPC_A: result := 'UPC_A';
    TBarcodeFormat.UPC_E: result := 'UPC_E';
    TBarcodeFormat.UPC_EAN_EXTENSION: result := 'UPC_EAN_EXTENSION';
    TBarcodeFormat.MSI: result := 'MSI';
    TBarcodeFormat.PLESSEY: result := 'PLESSEY';
    TBarcodeFormat.ALL_1D: result := 'EAN_14';

  end;
end;
procedure TfrmCodigoBarraV2.AtivaLeitura(tipo : TBarcodeFormat);
begin

  if Assigned(fScanManager) then
    fScanManager.Free;

  fScanManager := TScanManager.Create(tipo,nil);

  Camera.Active := False;
  Camera.Kind := FMX.Media.TCameraKind.BackCamera;
  Camera.FocusMode := FMX.Media.TFocusMode.ContinuousAutoFocus;
  Camera.Quality := FMX.Media.TVideoCaptureQuality.HighQuality;

  //Ajuste empírico - TCameraComponent quality change when reactivated!
  Camera.FocusMode := FMX.Media.TFocusMode.ContinuousAutoFocus;
  Camera.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
  Camera.Active := True;

  ok:=True;

end;
//***********************************************************
procedure TfrmCodigoBarraV2.btnOKClick(Sender: TObject);
begin

  PanelMessage.Visible:=False;
  btnOK.Visible:=False;
  lblMsg.Visible:= False;
  lblMsgCode.Visible:=False;


end;
procedure TfrmCodigoBarraV2.FinalizaLeitura;
begin
  Camera.Active := False;
  fScanManager.Free;
  fFMXBarcode.Free;
  fScanInProgress := False;

  ok := False;

end;
procedure TfrmCodigoBarraV2.CameraSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, GetImage);
end;
//***********************************************************
procedure TfrmCodigoBarraV2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not fInProgress;
end;
procedure TfrmCodigoBarraV2.FormCreate(Sender: TObject);
var
  AppEventSvc: IFMXApplicationEventService;
begin

  PanelMessage.Visible:=False;
  btnOK.Visible:=False;
  lblMsg.Visible:= False;
  lblMsgCode.Visible:=False;

  AtivaLeitura(TBarcodeFormat.Auto);
  txtLeitura.Text := 'Leitura de Tudo';

  lFlash := False;
  iCount:=1;

  UltimoCodigo:='';
  UltimaHora:=time;

  if TPlatformServices.Current.SupportsPlatformService
     ( IFMXApplicationEventService, IInterface(AppEventSvc)) then
     begin
       AppEventSvc.SetApplicationEventHandler(AppEvent);
     end;

  fFrameTake := 0;
  fInProgress := False;

end;
procedure TfrmCodigoBarraV2.FormDestroy(Sender: TObject);
begin
  fScanManager.Free;
  fFMXBarcode.Free;
end;
procedure TfrmCodigoBarraV2.GetImage;
var
  scanBitmap: TBitmap;
  ReadResult: TReadResult;
  ItemAdd : TListViewItem;

begin
  Camera.SampleBufferToBitmap(imgCamera.Bitmap, True);

  if (fScanInProgress) then
  begin
    exit;
  end;

  { This code will take every 2 frame. }
  inc(fFrameTake);
  if (fFrameTake mod 2 <> 0) then
  begin
    exit;
  end;

  scanBitmap := TBitmap.Create();
  scanBitmap.Assign(imgCamera.Bitmap);
  ReadResult := nil;

  TTask.Run(
    procedure
    begin
      try
        fScanInProgress := True;
        try
          ReadResult := fScanManager.Scan(scanBitmap);

        except
          on E: Exception do
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                lblResultadoLeitura.Text := E.Message;
              end);

            exit;
          end;
        end;

        TThread.Synchronize(nil,
          procedure
          var
            Codigo:string;
            tipoBarCode: string;
          begin
            if (ReadResult <> nil) then

            beepSound('Resource_2');
            Codigo := ReadResult.text;
            tipoBarCode := RetornaFormato(ReadResult.BarcodeFormat);

            begin
            //So registra mesmo codigo depois de 3 segundos
              if((Codigo<>UltimoCodigo)or(abs(time-UltimaHora)>3*SECOND))then begin
                UltimoCodigo := Codigo;
                UltimaHora:=Time;
                lblResultadoLeitura.Text := '('+inttostr(iCount)+') '+ReadResult.text;

                //Lista de Leitura
                  ListView1.BeginUpdate;
                   ListView1.Items.Clear;
                   ItemAdd := ListView1.Items.Add;
                   ItemAdd.Text := tipoBarCode + ': ' + ReadResult.text;
                  ListView1.EndUpdate;

                //

                   PanelMessage.Visible:=True;
                   btnOK.Visible:=True;
                   lblMsg.Visible:= True;
                   lblMsg.Text:= 'Código ' + tipoBarCode;
                   lblMsgCode.Visible:=True;
                   lblMsgCode.Text:= tipoBarCode+ ': '+ReadResult.text ;


                //
                  inc(iCount);

              end;
            end;
          end);
      finally
        ReadResult.Free;
        scanBitmap.Free;
        fScanInProgress := False;
      end;

    end);
end;



end.
