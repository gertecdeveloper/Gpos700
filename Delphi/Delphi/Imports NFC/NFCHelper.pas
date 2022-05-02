unit NFCHelper;
// Nesta implementação
// Registro 0 => Mensagem
// Registro 1 => URL
interface

uses
  Androidapi.JNI.Nfc,
  Androidapi.JNI.Nfc.Tech,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,

  FMX.Platform.Android,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.Jni,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Toast,

  FMX.Platform,
  System.Messaging,
  System.SysUtils,
  System.Types,
  FMX.Types,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  // FMX.ExtCtrlsm,
  FMX.Edit,
  FMX.ScrollBox,
  FMX.Memo

  //

  ;

type

NFC_WRITE_STATUS = (NFC_WRITE_IDLE, NFC_WRITE_PENDING, NFC_WRITE_OK, NFC_WRITE_FAIL);

TNFCHelper = class

  private
    var
      lReadId : Boolean;
      lReadMensagens : Boolean;
      lReadUrlCard : Boolean;
      lGravarMensagem : Boolean;
      lGravarUrl : Boolean;
      lFormat : Boolean; //

      AppEvents: IFMXApplicationEventService;
      NfcAdapter: JNfcAdapter;
      PendingIntent: JPendingIntent;


    procedure OnNewNfcIntent(Intent: JIntent);

    // Transforma uma String em JavaBytes
    function EncodeText(const Msg: string): JNdefRecord;

    // Faz a conversão de Bytes para String
    function DecodeText(RecordBytes: TJavaArray<Byte>): string;

    // Leitura da Mensagem do cartão
    procedure LeMensagemCartao(const Tag : JTag);

    // Faz a leitura das mensagens gravadas no Cartão
    function ReadMessageCard(const Tag: JTag): string;


    // Reset em todas as variáveis privadas
    procedure StartVariaveis;

    // Leitura do Id do cartão
    procedure LeIdCartao(const TagParcel : JParcelable);

    // Grava uma Mensagem de texto no cartão
    procedure GravarMensagem(const Tag: JTag);
    function GravaCartao(const Tag: JTag): Boolean;

    // Proxy for calling NfcAdapter.enableForegroundDispatch
    procedure EnableForegroundDispatch;
    function ApplicationEventHandler(AAppEvent: TApplicationEvent;
                                     AContext: TObject): Boolean;

    procedure HandleIntentMessage(const Sender: TObject; const M: TMessage);

    // Cria uma string concatenando juntos todos os valores hexadecimais de cada byte
    function JavaBytesToString(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;

    // Cria uma string concatenando juntos todos os valores hexadecimais de cada byte no reverso
    function JavaBytesToStringReverse(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;

    // Cria uma string concatenando juntos os caracteres ANSI representados por cada byte
    function JavaBytesToText(Bytes: TJavaArray<Byte>): string;

    function JavaBytesToNumeric(Bytes: TJavaArray<Byte>): string;

    function DecodeURI(RecordBytes: TJavaArray<Byte>): string;

    // Formata cartão
    procedure FormatandoNFC(const Tag: JTag); //
    function FormataNfc(const Tag: JTag): Boolean; //

  public

    NFCMensagem: string;
    NFCUrl: string;
    CardId: string;
    CardIdHex: string;
    NFCWriteStatus : NFC_WRITE_STATUS;
    FormatNFC: string; //

    constructor Create;

    procedure setLeituraID;

    procedure setLeituraMensagem;

    procedure setGravaURL;

    procedure setGravaMensagemURL(const mensagem:string; const URL:string);
    procedure setMensagemURL(const mensagem:string; const URL:string);

    procedure setLeUrlCartao;

    procedure ClearData;

    procedure setFormat;

end;


implementation

uses
  System.StrUtils,
  System.Permissions,
  FMX.DialogService;

constructor TNFCHelper.Create;
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

  ClearData;

end;


procedure TNFCHelper.ClearData;
begin

  NFCMensagem := '';
  NFCUrl := '';
  CardId := '';
  CardIdHex := '';
  NFCWriteStatus := NFC_WRITE_IDLE;
end;

{$REGION 'JNI substitute for calling NfcAdapter.enableForegroundDispatch'}
procedure TNFCHelper.EnableForegroundDispatch;
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

function TNFCHelper.ApplicationEventHandler(AAppEvent: TApplicationEvent;
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
              Toast('NFC não está ativado.' + LineFeed + 'Ativando as configurações de NFC.');
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

procedure TNFCHelper.HandleIntentMessage(const Sender: TObject;
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

procedure TNFCHelper.OnNewNfcIntent(Intent: JIntent);
var
  TagParcel: JParcelable;
  Tag : JTag;

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
        Tag := TJTag.Wrap(TagParcel);

        if lReadId then
          LeIdCartao(TagParcel)

        else if lReadMensagens then
          LeMensagemCartao(TJTag.Wrap(TagParcel))

        else if lGravarMensagem then
          GravarMensagem(TJTag.Wrap(TagParcel))

        else if lFormat then    //
          FormatandoNFC(TJTag.Wrap(TagParcel))  

        //else
        //  MensagemEscolhaFuncao

      end

    else
      TDialogService.ShowMessage('Falha ao obter informações do cartão.');

  except
    on e: exception do begin
      ShowMessage('Erro=>'+e.Message);
    end;
  end;

end;

function TNFCHelper.DecodeText(RecordBytes: TJavaArray<Byte>): string;
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

function TNFCHelper.EncodeText(const Msg: string): JNdefRecord;
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
  Result := TJNdefRecord.JavaClass.init(TJNdefRecordTNF_WELL_KNOWN, TJNdefRecord.JavaClass.RTD_TEXT,
    TJavaArray<Byte>.Create(0), JPayload);
end;

function TNFCHelper.JavaBytesToString(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
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

function TNFCHelper.JavaBytesToStringReverse(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
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

function TNFCHelper.JavaBytesToText(Bytes: TJavaArray<Byte>): string;
var
  I: Integer;
begin
  for I := 0 to Pred(Bytes.Length) do
  begin
    Result := Result + Char(Bytes.Items[I]);
  end;
end;

function TNFCHelper.JavaBytesToNumeric(Bytes: TJavaArray<Byte>): string;
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

function TNFCHelper.ReadMessageCard(const Tag: JTag): string;
var
  I : Integer;
  lResult : Boolean;
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  mensagem: string;

begin
  NDef := TJNdef.JavaClass.get(Tag);
  if NDef <> nil then
  begin
    try
      NDef.connect;
      lResult := NDef.isConnected;
      if lResult then
      begin

        NDefMsg := Ndef.getNdefMessage;

        for I := 0 to NDefMsg.getRecords.Length-1 do

          if I = 0 then
            begin
              NFCMensagem := DecodeText(NDefMsg.getRecords[I].getPayload);
              mensagem := mensagem + DecodeText(NDefMsg.getRecords[I].getPayload);
            end;

          if I > 0  then // Favor implementar as outras opções se necessario
            begin
              NFCUrl := DecodeURI(NDefMsg.getRecords[1].getPayload);
              mensagem := mensagem + #13#10+ #13#10 + 'URL'+ #13#10 + DecodeURI(NDefMsg.getRecords[1].getPayload);
            end;


        Result := mensagem;

        NDef.close;
      end;
    except
      on EJNIException do
        Result := 'Não foi possível ler a mensagem.';
    end;
  end
  else
    raise Exception.Create('Esta não é uma tag compatível com NDEF!');
end;

//******************************************************************************
function TNFCHelper.FormataNfc(const Tag: JTag): Boolean;
var
  {I : Integer;
  lResultNDef : Boolean;
  teste: JNdefFormatableClass;
  formatNDef: JNdefFormatable;
  NDef: JNdef;
  formatNDefMsg: JNdefMessage;
  formatMensagem: string;}
  I : Integer;
  lResult : Boolean;
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  mensagem: string;

begin

  NDef := TJNdef.JavaClass.get(Tag);
  //formatNDef := teste.get(Tag);

  if NDef <> nil then
  begin
    try
      NDef.connect;
      lResult := NDef.isConnected;

      ShowMessage('isConnect ' + BoolToStr(lResult));

      if lResult then
      begin

        NDefMsg := Ndef.getNdefMessage;

        Result := True;

        NDef.close;
      end;
    except
      on EJNIException do
        Result := False;
    end;
  end
  else
    raise Exception.Create('Esta não é uma tag compatível com NDEF!');
end;
//******************************************************************************

function TNFCHelper.GravaCartao(const Tag: JTag): Boolean;
var
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  NDefRecords: TJavaObjectArray<JNdefRecord>;
  itens : Integer;
begin
  NDef := TJNdef.JavaClass.get(Tag);
  if NDef <> nil then
    begin
      try
        NDef.connect;
        Result := NDef.isConnected;
        if Result then
        begin
          // Faça uma lista de 2 registros NDEF, um com algum texto e outro com um URL
          NDefRecords := TJavaObjectArray<JNdefRecord>.Create(2);
          NDefRecords.Items[0] := EncodeText(Self.NFCMensagem);
          NDefRecords.Items[1] := TJNdefRecord.JavaClass.createUri(StringToJString(Self.NFCUrl));
          NDefMsg := TJNdefMessage.JavaClass.init(NDefRecords);
          NDef.writeNdefMessage(NDefMsg);
          NDef.close;
          Result := True;
        end;
      except
        on EJNIException do
          Result := False;
      end;
    end
  else
    raise Exception.Create('Esta não é uma tag compatível com NDEF!');
end;

procedure TNFCHelper.LeIdCartao(const TagParcel : JParcelable);
var
  IdArray: TJavaArray<byte>;

begin

  try
    try
      IdArray := TJTag.Wrap(TagParcel).getId;
      if IdArray.Length > 0  then begin
          CardId := JavaBytesToNumeric(IdArray);
          CardIdHex:= JavaBytesToString(IdArray);
          //TDialogService.ShowMessage('ID do cartão: ' + JavaBytesToString(IdArray)+#13#10+'ID do cartão: ' + JavaBytesToNumeric(IdArray))
      end else
        TDialogService.ShowMessage('Não foi possível ler o ID do cartão.');
    except
      on e: exception do begin
        ShowMessage('Erro=>'+e.Message);
      end;
    end;
  finally
    StartVariaveis;
  end;

end;
//******************************************************************************
procedure TNFCHelper.FormatandoNFC(const Tag: JTag);
var
lFormatResult: Boolean;
begin

  try

    try
      lFormatResult := FormataNfc(Tag);

      if lFormatResult then
        //TDialogService.ShowMessage('Dados gravados com sucesso.')
        FormatNFC := 'Cartão Formatado'
      else
        //TDialogService.ShowMessage('Erro ao gravar mensagem no cartão.');
        FormatNFC := 'Não é necessário formatar este cartão'

    except

      on e: exception do begin
        ShowMessage('Erro=>'+e.Message);
      end;

    end;

  finally
    StartVariaveis;
  end;


end;
//******************************************************************************
procedure TNFCHelper.LeMensagemCartao(const Tag : JTag);
var
  mensagem : string;
begin

  try
    try
      mensagem := ReadMessageCard(Tag);

      if mensagem.Length > 0  then
        begin
          //MensagemGravada;
          //MensagemURL;
          //TDialogService.ShowMessage('Mensagem' + #13#10 + mensagem );
        end
      else
        TDialogService.ShowMessage('Não foi possível ler a mensagem gravada.');
    except

      on e: exception do begin
        ShowMessage('Erro=>'+e.Message);
      end;

    end;
  finally
    StartVariaveis;
  end;

end;

procedure TNFCHelper.GravarMensagem(const Tag : JTag);
var
  lResult : Boolean;
begin

  try

    try
      lResult := GravaCartao(Tag);

      if lResult then
        //TDialogService.ShowMessage('Dados gravados com sucesso.')
        NFCWriteStatus := NFC_WRITE_OK
      else
        //TDialogService.ShowMessage('Erro ao gravar mensagem no cartão.');
        NFCWriteStatus := NFC_WRITE_FAIL;

    except

      on e: exception do begin
        ShowMessage('Erro=>'+e.Message);
      end;

    end;

  finally
    StartVariaveis;
  end;

end;

procedure TNFCHelper.StartVariaveis;
begin

  lReadId := False;
  lReadMensagens := False;
  lReadUrlCard := False;

  lGravarMensagem := False;
  lGravarUrl := False;

end;

procedure TNFCHelper.setLeituraID;
begin
  lReadId := True;
end;

procedure TNFCHelper.setLeituraMensagem;
begin
  lReadMensagens := True;
end;

procedure TNFCHelper.setGravaURL;
begin
  lGravarUrl := True;
  NFCWriteStatus := NFC_WRITE_PENDING;
end;

//***************************************************************
procedure TNFCHelper.setFormat;
begin
    lFormat := True;
end;
//***************************************************************

procedure TNFCHelper.setMensagemURL(const mensagem:string; const URL:string);
begin
  Self.NFCMensagem := mensagem;
  Self.NFCUrl := URL;
end;

procedure TNFCHelper.setGravaMensagemURL(const mensagem:string; const URL:string);
begin

  setMensagemURL(mensagem,URL);

  lGravarMensagem := True;
  NFCWriteStatus := NFC_WRITE_PENDING;
end;


procedure TNFCHelper.setLeUrlCartao;
begin
  lReadUrlCard := True;
end;

function TNFCHelper.DecodeURI(RecordBytes: TJavaArray<Byte>): string;
var
  ID: Byte;
  I: Integer;
begin
  if RecordBytes.Length < 2 then
    Exit;
  ID := RecordBytes.Items[0];
  for I := 1 to Pred(RecordBytes.Length) do
    begin
      Result := Result + Char(RecordBytes.Items[I]);
    end;

  case ID of
    1: Result := 'http://www.' + Result;
    2: Result := 'https://www.' + Result;
    3: Result := 'http://' + Result;
    4: Result := 'https://' + Result;
    5: Result := 'tel:' + Result;
    6: Result := 'mailto:' + Result;
    7: Result := 'ftp://anonymous:anonymous@' + Result;
    8: Result := 'ftp://ftp.' + Result;
    9: Result := 'ftps://' + Result;
    10: Result := 'sftp://' + Result;
    11: Result := 'smb://' + Result;
    12: Result := 'nfs://' + Result;
    13: Result := 'ftp://' + Result;
    14: Result := 'dav://' + Result;
    15: Result := 'news:' + Result;
    16: Result := 'telnet://' + Result;
    17: Result := 'imap:' + Result;
    18: Result := 'rtsp://' + Result;
    19: Result := 'urn:' + Result;
    20: Result := 'pop:' + Result;
    21: Result := 'sip:' + Result;
    22: Result := 'sips:' + Result;
    23: Result := 'tftp:' + Result;
    24: Result := 'btspp://' + Result;
    25: Result := 'btl2cap://' + Result;
    26: Result := 'btgoep://' + Result;
    27: Result := 'tcpobex://' + Result;
    28: Result := 'irdaobex://' + Result;
    29: Result := 'file://' + Result;
    30: Result := 'urn:epc:id:' + Result;
    31: Result := 'urn:epc:tag:' + Result;
    32: Result := 'urn:epc:pat:' + Result;
    33: Result := 'urn:epc:raw:' + Result;
    34: Result := 'urn:epc:' + Result;
    35: Result := 'urn:nfc:' + Result;
  end;
end;

end.
