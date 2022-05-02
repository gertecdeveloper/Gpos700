unit G700NFC;

interface

uses
  Androidapi.JNI.Nfc,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,

  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,

  FMX.Platform.Android,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.Jni,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,

  FMX.Platform,
  System.Messaging,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,


  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,

  FMX.Controls.Presentation,

  JavaInterfaces,
  //G700Interface,

  System.Threading,
  FMX.DialogService
  ;

type

TG700NFC = class

  private
    var
      aTask : ITask;
      iCL : JICL;
      PollingInfo : JGEDI_CL_st_ISO_PollingInfo;
      MF_key : JGEDI_CL_st_MF_Key;
      AppEvents: IFMXApplicationEventService;
      NfcAdapter: JNfcAdapter;
      PendingIntent: JPendingIntent;

      lReadIdCartao : Boolean;
      lReadCartao   : Boolean;

      CardId,
      CardIdHex : String;

    // Faz o start das variáveis
    procedure StartVariaveis;

    // NFC
    procedure OnNewNfcIntent(Intent: JIntent);
    // Proxy for calling NfcAdapter.enableForegroundDispatch
    procedure EnableForegroundDispatch;
    function ApplicationEventHandler(AAppEvent: TApplicationEvent;
                                     AContext: TObject): Boolean;
    procedure HandleIntentMessage(const Sender: TObject; const M: TMessage);
    ///

    // Faz a leitura de um setor no cartão
    procedure FazLeituraCartao;

    // Faz a gravação no cartão
    procedure FazGravacaoCartao;

    // Converte Byte em String
    function JavaBytesToNumeric(Bytes: TJavaArray<Byte>): string;

    function JavaBytesToString(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;

    // Transforma uma String em JavaBytes
    function EncodeText(const Msg: string): TJavaArray<Byte>;

    // Transforma JavaBytes em String
    function DecodeText(RecordBytes: TJavaArray<Byte>): string;

    // Cria uma string concatenando juntos todos os valores hexadecimais de cada byte no reverso
    function JavaBytesToStringReverse(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;


  public

    constructor Create;
    procedure PowerOff;
    procedure PowerOn;
    procedure nfcDisable;

    // Faz a leitura do cartão
    procedure setLeituraID;

    // Faz a leitura dos setores
    procedure setLeituraSetor;

    // Faz a leitura no Id do Cartão.
    procedure LeIdCartao;

    function retornaIdCartao: string;
    function retornaIdCartaoHex: string;
    procedure LimpaIdCartao;

end;

implementation

var
  iGEDI : JIGEDI;
  //: TG700NFC;
  aTask: ITask;

//****************************************************
//               Constructor
//****************************************************

procedure TG700NFC.PowerOff;
var i:integer;
begin
  for i:= 1 to 4 do begin ;//Recomendavel executar N vezes
    if(Self.iCL <> nil) then
      Self.iCL.PowerOff;

    if NfcAdapter <> nil then
      NfcAdapter.disableForegroundDispatch(TAndroidHelper.Activity);

    sleep(250);
    Log.d('Executando TG700NFC.PowerOffA No Task250ms('+inttostr(i)+')');

  end;//for i

end;

procedure TG700NFC.PowerOn;
begin

  EnableForegroundDispatch;

end;


procedure TG700NFC.nfcDisable;
begin
 if NfcAdapter <> nil then
   NfcAdapter.disableForegroundDispatch(TAndroidHelper.Activity);
end;

constructor TG700NFC.Create;
var
    ClassIntent: JIntent;
begin

  // Configurar o evento que é acionado quando o aplicativo é trazido de volta ao primeiro plano
  if TPlatformServices.Current.SupportsPlatformService(
       IFMXApplicationEventService,
       IInterface(AppEvents)) then
    begin
      AppEvents.SetApplicationEventHandler(ApplicationEventHandler);
    end;

  // Assinar a mensagem FMX enviada quando onNewIntent é chamado
  // com uma intenção contendo qualquer uma dessas três ações intencionais.
  // Suporte para isso foi adicionado no Delphi 10 Seattle.
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED);
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED);
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageReceivedNotification, HandleIntentMessage);
  NfcAdapter := TJNfcAdapter.JavaClass.getDefaultAdapter(TAndroidHelper.Context);
  if NfcAdapter = nil then
    begin

      // Poderia fazer com a saída daqui talvez
      raise Exception.Create('No NFC adapter present');
    end;

  // Configurar a intenção pendente necessária para habilitar o despacho de primeiro plano NFC
  ClassIntent := TJIntent.JavaClass.init(TAndroidHelper.Context, TAndroidHelper.Activity.getClass);
  PendingIntent := TJPendingIntent.JavaClass.getActivity(TAndroidHelper.Context, 0,
    ClassIntent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_SINGLE_TOP), 0);


  StartVariaveis;

end;

//****************************************************

//****************************************************
//               Privates
//****************************************************

//****************************************************
procedure TG700NFC.StartVariaveis;
begin
  lReadIdCartao := False;
  lReadCartao   := False;
end;

//****************************************************

function TG700NFC.JavaBytesToNumeric(Bytes: TJavaArray<Byte>): string;
var
  I: integer;
  soma:LongWord;
begin
  if Bytes <> nil then begin
    soma:=0;
    for I := Pred(Bytes.Length) downto 0 do
    begin
      soma := soma*256;
      soma:=soma+Bytes.Items[I];
    end;
    result:=IntToStr(soma);
  end;
end;

//****************************************************
function TG700NFC.JavaBytesToString(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
var
  I: Integer;
begin
  if Bytes <> nil then
    for I := 0 to Pred(Bytes.Length) do
    begin
      Result := Result + IntToHex(Bytes.Items[I], 2);
      if (I < Pred(Bytes.Length)) and (Separator.Length > 0) then
        Result := Result + Separator;
    end;
end;

function TG700NFC.EncodeText(const Msg: string): TJavaArray<Byte>;
var
  JMsg: JString;
  JMsgBytes: TJavaArray<Byte>;
  JMsgLen: Integer;
  JLangLen: Byte;
  JPayload: TJavaArray<Byte>;
  I: Integer;
begin
  JMsg := StringToJString(Msg);
  JMsgBytes := JMsg.getBytes;
  JMsgLen := JMsgBytes.Length;
  JPayload := TJavaArray<Byte>.Create(1 + JMsgLen);

  // Definir o byte de status (veja a especificação do NDEF para os bits)
  JPayload.Items[0] := JLangLen;

  for I := 0 to Pred(JMsgLen) do
    JPayload.Items[I + 1 + JLangLen] := JMsgBytes.Items[I];

  Result := JPayload;
  
end;

// ****************************************************

{$REGION 'JNI substitute for calling NfcAdapter.enableForegroundDispatch'}
procedure TG700NFC.EnableForegroundDispatch;
var
  PEnv: PJniEnv;
  AdapterClass: JNIClass;
  NfcAdapterObject, PendingIntentObject: JNIObject;
  MethodID: JNIMethodID;
begin
  // Não podemos simplesmente chamar o método importado do NfcAdapter enableForegroundDispatch
  // porque irá falhar devido a uma falha na Ponte JNI, que não
  // suporta parâmetros de matriz 2D. Então, ao invés disso, nós o chamamos através de uma chamada JNI manual.
  PEnv := TJNIResolver.GetJNIEnv;
  NfcAdapterObject := (NfcAdapter as ILocalObject).GetObjectID;
  PendingIntentObject := (PendingIntent as ILocalObject).GetObjectID;
  AdapterClass := PEnv^.GetObjectClass(PEnv, NfcAdapterObject);
  // Obtenha a assinatura com:
  // javap -s -classpath <path_to_android_platform_jar> android.nfc.NfcAdapter
  MethodID := PEnv^.GetMethodID(
    PEnv, AdapterClass, 'enableForegroundDispatch',
    '(Landroid/app/Activity;Landroid/app/PendingIntent;' +
    '[Landroid/content/IntentFilter;[[Ljava/lang/String;)V');

  PEnv^.DeleteLocalRef(PEnv, AdapterClass);

  // Finalmente, chame o método Java de destino
  PEnv^.CallVoidMethodA(PEnv, NfcAdapterObject, MethodID,
    PJNIValue(ArgsToJNIValues([JavaContext, PendingIntentObject, nil, nil])));
end;
{$ENDREGION}

// ****************************************************

function TG700NFC.ApplicationEventHandler(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin

  case AAppEvent of
    TApplicationEvent.FinishedLaunching:
      begin
        //
      end;
    TApplicationEvent.BecameActive:
      begin
        if NfcAdapter <> nil then
        begin
          if not NfcAdapter.isEnabled then
          begin
            begin
              TDialogService.ShowMessage('NFC não está ativado.' + LineFeed + 'Ativando as configurações de NFC.');
              TAndroidHelper.Activity.startActivity(
                TJIntent.JavaClass.init(StringToJString('android.settings.NFC_SETTINGS')));
            end
          end
          else
            EnableForegroundDispatch
        end;
      end;
    TApplicationEvent.WillBecomeInactive:
      begin
        if (NfcAdapter <> nil) then
          NfcAdapter.disableForegroundDispatch(TAndroidHelper.Activity);
      end;
    TApplicationEvent.WillTerminate:
      begin
        //
      end;
  end;

  Result := True;

end;

// ****************************************************

procedure TG700NFC.HandleIntentMessage(const Sender: TObject;
  const M: TMessage);
var
  Intent: JIntent;
begin
  if M is TMessageReceivedNotification then
  begin
    Intent := TMessageReceivedNotification(M).Value;
    if Intent <> nil then
    begin
      if TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED.equals(Intent.getAction) or
         TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED.equals(Intent.getAction) or
         TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED.equals(Intent.getAction) then
      begin
        OnNewNfcIntent(Intent);
      end;
    end;
  end;
end;

// ****************************************************

procedure TG700NFC.OnNewNfcIntent(Intent: JIntent);
var
  TagParcel: JParcelable;

begin

  try
    Log.d('OnNewIntent');
    TAndroidHelper.Activity.setIntent(Intent);
    Log.d('Intent action = %s', [JStringToString(Intent.getAction)]);

    Log.d('Obtendo parcela de tag da intenção recebida');
    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
    if TagParcel <> nil then
      begin
        Log.d('Embrulho tag da parcela');

        if lReadIdCartao then
          LeIdCartao
        else if lReadCartao then
          // FazLeituraCartao;
          FazGravacaoCartao;
      end
    else
      TDialogService.ShowMessage('Falha ao obter informações do cartão.');

  except
    on e: exception do begin
      ShowMessage('Erro=>'+e.Message);
    end;
  end;

end;

// ****************************************************

procedure TG700NFC.LeIdCartao;
var
  idByte : TJavaArray<Byte>;
begin

  try
    try
      Self.iCL := TJGEDI.JavaClass.getInstance.getCL;
      Self.iCL.PowerOn;
      PollingInfo := iCL.ISO_Polling(12*100);
      idByte := PollingInfo.abUID;
      Self.iCL.PowerOff;
//       TDialogService.ShowMessage('ID: ' + JavaBytesToNumeric(idByte));
      CardId := JavaBytesToNumeric(idByte);
      CardIdHex:= JavaBytesToString(IdByte);

    except
      on e: exception do begin
          ShowMessage('Erro=>'+e.Message);
      end;
    end;
  finally
    // MensagemEscolhaOpcao;
    // StartVariaveis;
  end;
end;

// ****************************************************

procedure TG700NFC.FazLeituraCartao;
var
  I : Integer;
  senha : TJavaArray<Byte>;
  read :  TJavaArray<Byte>;
begin

  try

    try
      Self.iCL := TJGEDI.JavaClass.getInstance.getCL;
      // Self.iCL.PowerOn;
      PollingInfo := iCL.ISO_Polling(12*100);

      read := Self.iCL.MF_BlockRead(10);
      // Self.iCL.PowerOff;

      TDialogService.ShowMessage('Mensagem: ' + DecodeText(read));

    except
      on e: exception do begin
          ShowMessage('Erro=>'+e.Message);
      end;
    end;
  finally
    StartVariaveis;
  end;
end;

// ****************************************************

procedure TG700NFC.FazGravacaoCartao;
var
  I : Integer;
  senha : TJavaArray<Byte>;
  read :  TJavaArray<Byte>;
begin

  try

    try
      Self.iCL := TJGEDI.JavaClass.getInstance.getCL;

      Self.iCL.PowerOn;
      PollingInfo := iCL.ISO_Polling(100);

      senha := EncodeText('0000');

      MF_key := TJGEDI_CL_st_MF_Key.Create;
      MF_key.abValue := senha;

      // Self.iCL.MF_Authentication(0, MF_key, senha);
      Self.iCL.MF_SignatureGet(0);

//       read := Self.iCL.MF_BlockRead(10);
      Self.iCL.PowerOff;

      TDialogService.ShowMessage('Mensagem: ' + DecodeText(read) );

    except
      on e: exception do begin
          ShowMessage('Erro=>'+e.Message);
      end;
    end;
  finally
    StartVariaveis;
  end;
end;

// ****************************************************

function TG700NFC.DecodeText(RecordBytes: TJavaArray<Byte>): string;
var
  I : Integer;
  IANA: string;
begin

  if RecordBytes.Length <= 0 then begin
    Result := '';
    exit;
  end;

  for I := 0 to RecordBytes.Length-1 do
    IANA := IANA + Char(RecordBytes.Items[I]);

  Result := IANA;
end;

// ****************************************************

function TG700NFC.JavaBytesToStringReverse(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
var
  I: Integer;
begin
  if Bytes <> nil then
    for I := Pred(Bytes.Length) downto 0 do
    begin
      Result := Result + IntToHex(Bytes.Items[I], 2);
      if (I > 0) and (Separator.Length > 0) then
        Result := Result + Separator;
    end;
end;

// ****************************************************

// ****************************************************
//               Public
// ****************************************************

// ****************************************************

procedure TG700NFC.setLeituraID;
begin
  lReadIdCartao := True;
end;

//****************************************************

procedure TG700NFC.setLeituraSetor;
begin
  lReadCartao := True;
end;

//****************************************************
function TG700NFC.retornaIdCartao: string;
begin
  result := CardId;
end;
//****************************************************
function TG700NFC.retornaIdCartaoHex: string;
begin
  result := CardIdHex;
end;
//****************************************************
procedure TG700NFC.LimpaIdCartao;
begin
  CardId:='';
  CardIdHex:='';
end;

//****************************************************

// ****************************************************
//               initialization
// ****************************************************

//****************************************************
initialization

  aTask := TTask.Create(procedure ()
    begin
      iGEDI := TJGEDI.JavaClass.getInstance(TAndroidHelper.Context);
    end);
  aTask.Start;
end.
