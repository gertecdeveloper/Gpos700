
unit JavaInterfacesNew;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JUsbAccessory = interface;//android.hardware.usb.UsbAccessory
  JUsbConfiguration = interface;//android.hardware.usb.UsbConfiguration
  JUsbDevice = interface;//android.hardware.usb.UsbDevice
  JUsbDeviceConnection = interface;//android.hardware.usb.UsbDeviceConnection
  JUsbEndpoint = interface;//android.hardware.usb.UsbEndpoint
  JUsbInterface = interface;//android.hardware.usb.UsbInterface
  JUsbManager = interface;//android.hardware.usb.UsbManager
  JUsbRequest = interface;//android.hardware.usb.UsbRequest
  Jsatger_BuildConfig = interface;//com.phi.gertec.sat.satger.BuildConfig
  JSatGerConnectionManager = interface;//com.phi.gertec.sat.satger.SatGerConnectionManager
  JSatGerConnectionManager_1 = interface;//com.phi.gertec.sat.satger.SatGerConnectionManager$1
  JSatGerConnectionManager_2 = interface;//com.phi.gertec.sat.satger.SatGerConnectionManager$2
  JSatGerConnectionManager_ConnectionFailedException = interface;//com.phi.gertec.sat.satger.SatGerConnectionManager$ConnectionFailedException
  JSatGerConnectionManager_Listener = interface;//com.phi.gertec.sat.satger.SatGerConnectionManager$Listener
  JSatGerLib = interface;//com.phi.gertec.sat.satger.SatGerLib
  JSatGerLib_OnDataReceived = interface;//com.phi.gertec.sat.satger.SatGerLib$OnDataReceived
  JSatGerProtocolParser = interface;//com.phi.gertec.sat.satger.SatGerProtocolParser
  JSerialInputOutputManager_Listener = interface;//com.phi.gertec.sat.serial.SerialInputOutputManager$Listener
  JSatGerProtocolParser_1 = interface;//com.phi.gertec.sat.satger.SatGerProtocolParser$1
  J1_1 = interface;//com.phi.gertec.sat.satger.SatGerProtocolParser$1$1
  JSatGerProtocolParser_2 = interface;//com.phi.gertec.sat.satger.SatGerProtocolParser$2
  JUsbSerialDriver = interface;//com.phi.gertec.sat.serial.UsbSerialDriver
  JCdcAcmSerialDriver = interface;//com.phi.gertec.sat.serial.CdcAcmSerialDriver
  JUsbSerialPort = interface;//com.phi.gertec.sat.serial.UsbSerialPort
  JCommonUsbSerialPort = interface;//com.phi.gertec.sat.serial.CommonUsbSerialPort
  JCdcAcmSerialDriver_CdcAcmSerialPort = interface;//com.phi.gertec.sat.serial.CdcAcmSerialDriver$CdcAcmSerialPort
  JHexDump = interface;//com.phi.gertec.sat.serial.HexDump
  JProbeTable = interface;//com.phi.gertec.sat.serial.ProbeTable
  JSerialInputOutputManager = interface;//com.phi.gertec.sat.serial.SerialInputOutputManager
  JSerialInputOutputManager_State = interface;//com.phi.gertec.sat.serial.SerialInputOutputManager$State
  JUsbId = interface;//com.phi.gertec.sat.serial.UsbId
  JUsbSerialProber = interface;//com.phi.gertec.sat.serial.UsbSerialProber
  JUsbSerialRuntimeException = interface;//com.phi.gertec.sat.serial.UsbSerialRuntimeException

// ===== Interface declarations =====

  JUsbAccessoryClass = interface(JObjectClass)
    ['{1D9B9887-3355-48AD-9E48-30EA6B124537}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function getManufacturer: JString; cdecl;//Deprecated
    {class} function getModel: JString; cdecl;//Deprecated
    {class} function getSerial: JString; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;//Deprecated
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbAccessory')]
  JUsbAccessory = interface(JObject)
    ['{083B13FB-2A1A-4659-BECD-9C245475B724}']
    function describeContents: Integer; cdecl;//Deprecated
    function equals(obj: JObject): Boolean; cdecl;//Deprecated
    function getDescription: JString; cdecl;//Deprecated
    function getUri: JString; cdecl;//Deprecated
    function getVersion: JString; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
  end;
  TJUsbAccessory = class(TJavaGenericImport<JUsbAccessoryClass, JUsbAccessory>) end;

  JUsbConfigurationClass = interface(JObjectClass)
    ['{98469519-6EAB-4A27-9B06-2C4A07DC51C8}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function describeContents: Integer; cdecl;//Deprecated
    {class} function getId: Integer; cdecl;//Deprecated
    {class} function getMaxPower: Integer; cdecl;//Deprecated
    {class} function getName: JString; cdecl;//Deprecated
    {class} function isRemoteWakeup: Boolean; cdecl;//Deprecated
    {class} function isSelfPowered: Boolean; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;//Deprecated
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbConfiguration')]
  JUsbConfiguration = interface(JObject)
    ['{3CAF57A3-D977-4A31-BD15-1CFDE08316F5}']
    function getInterface(index: Integer): JUsbInterface; cdecl;//Deprecated
    function getInterfaceCount: Integer; cdecl;//Deprecated
  end;
  TJUsbConfiguration = class(TJavaGenericImport<JUsbConfigurationClass, JUsbConfiguration>) end;

  JUsbDeviceClass = interface(JObjectClass)
    ['{23359F82-699F-48E1-B1DD-43DD18455D2D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function getConfigurationCount: Integer; cdecl;//Deprecated
    {class} function getDeviceClass: Integer; cdecl;//Deprecated
    {class} function getDeviceId: Integer; cdecl; overload;//Deprecated
    {class} function getDeviceId(name: JString): Integer; cdecl; overload;//Deprecated
    {class} function getDeviceName(id: Integer): JString; cdecl; overload;//Deprecated
    {class} function getDeviceProtocol: Integer; cdecl;//Deprecated
    {class} function getDeviceSubclass: Integer; cdecl;//Deprecated
    {class} function getInterface(index: Integer): JUsbInterface; cdecl;//Deprecated
    {class} function getProductName: JString; cdecl;
    {class} function getSerialNumber: JString; cdecl;
    {class} function getVendorId: Integer; cdecl;
    {class} procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbDevice')]
  JUsbDevice = interface(JObject)
    ['{EAD5113C-AC54-4131-BED2-46F449FFD4B7}']
    function describeContents: Integer; cdecl;//Deprecated
    function equals(o: JObject): Boolean; cdecl;//Deprecated
    function getConfiguration(index: Integer): JUsbConfiguration; cdecl;//Deprecated
    function getDeviceName: JString; cdecl; overload;//Deprecated
    function getInterfaceCount: Integer; cdecl;
    function getManufacturerName: JString; cdecl;
    function getProductId: Integer; cdecl;
    function getVersion: JString; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJUsbDevice = class(TJavaGenericImport<JUsbDeviceClass, JUsbDevice>) end;

  JUsbDeviceConnectionClass = interface(JObjectClass)
    ['{83888555-657F-42A1-9BC1-8B23E2F69899}']
    {class} function bulkTransfer(endpoint: JUsbEndpoint; buffer: TJavaArray<Byte>; offset: Integer; length: Integer; timeout: Integer): Integer; cdecl; overload;
    {class} function claimInterface(intf: JUsbInterface; force: Boolean): Boolean; cdecl;
    {class} procedure close; cdecl;
    {class} function getRawDescriptors: TJavaArray<Byte>; cdecl;//Deprecated
    {class} function getSerial: JString; cdecl;//Deprecated
    {class} function releaseInterface(intf: JUsbInterface): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('android/hardware/usb/UsbDeviceConnection')]
  JUsbDeviceConnection = interface(JObject)
    ['{6CC94621-8592-4C7F-B28A-2E644692B85A}']
    function bulkTransfer(endpoint: JUsbEndpoint; buffer: TJavaArray<Byte>; length: Integer; timeout: Integer): Integer; cdecl; overload;
    function controlTransfer(requestType: Integer; request: Integer; value: Integer; index: Integer; buffer: TJavaArray<Byte>; length: Integer; timeout: Integer): Integer; cdecl; overload;//Deprecated
    function controlTransfer(requestType: Integer; request: Integer; value: Integer; index: Integer; buffer: TJavaArray<Byte>; offset: Integer; length: Integer; timeout: Integer): Integer; cdecl; overload;//Deprecated
    function getFileDescriptor: Integer; cdecl;//Deprecated
    function requestWait: JUsbRequest; cdecl;//Deprecated
    function setConfiguration(configuration: JUsbConfiguration): Boolean; cdecl;//Deprecated
    function setInterface(intf: JUsbInterface): Boolean; cdecl;//Deprecated
  end;
  TJUsbDeviceConnection = class(TJavaGenericImport<JUsbDeviceConnectionClass, JUsbDeviceConnection>) end;

  JUsbEndpointClass = interface(JObjectClass)
    ['{53DC559E-4126-4589-9CDF-681B6A461496}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function describeContents: Integer; cdecl;
    {class} function getAddress: Integer; cdecl;
    {class} function getAttributes: Integer; cdecl;
    {class} function getMaxPacketSize: Integer; cdecl;//Deprecated
    {class} function getType: Integer; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbEndpoint')]
  JUsbEndpoint = interface(JObject)
    ['{A9A1F612-B537-4C37-8523-1B7AEADB1D43}']
    function getDirection: Integer; cdecl;//Deprecated
    function getEndpointNumber: Integer; cdecl;//Deprecated
    function getInterval: Integer; cdecl;//Deprecated
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;//Deprecated
  end;
  TJUsbEndpoint = class(TJavaGenericImport<JUsbEndpointClass, JUsbEndpoint>) end;

  JUsbInterfaceClass = interface(JObjectClass)
    ['{59313EE2-7603-4BBC-ACBC-4BC863D31B6C}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function getEndpointCount: Integer; cdecl;//Deprecated
    {class} function getId: Integer; cdecl;//Deprecated
    {class} function getInterfaceClass: Integer; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;//Deprecated
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/hardware/usb/UsbInterface')]
  JUsbInterface = interface(JObject)
    ['{026556E6-07DF-422D-AF28-BC06795B91E7}']
    function describeContents: Integer; cdecl;//Deprecated
    function getAlternateSetting: Integer; cdecl;//Deprecated
    function getEndpoint(index: Integer): JUsbEndpoint; cdecl;//Deprecated
    function getInterfaceProtocol: Integer; cdecl;//Deprecated
    function getInterfaceSubclass: Integer; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
  end;
  TJUsbInterface = class(TJavaGenericImport<JUsbInterfaceClass, JUsbInterface>) end;

  JUsbManagerClass = interface(JObjectClass)
    ['{1048A6E9-E1B5-4DA5-A168-ED91E8DE5284}']
    {class} function _GetACTION_USB_ACCESSORY_ATTACHED: JString; cdecl;
    {class} function _GetACTION_USB_ACCESSORY_DETACHED: JString; cdecl;
    {class} function _GetACTION_USB_DEVICE_ATTACHED: JString; cdecl;
    {class} function _GetACTION_USB_DEVICE_DETACHED: JString; cdecl;
    {class} function _GetEXTRA_ACCESSORY: JString; cdecl;
    {class} function _GetEXTRA_DEVICE: JString; cdecl;
    {class} function _GetEXTRA_PERMISSION_GRANTED: JString; cdecl;
    {class} function getAccessoryList: TJavaObjectArray<JUsbAccessory>; cdecl;
    {class} function getDeviceList: JHashMap; cdecl;
    {class} function openDevice(device: JUsbDevice): JUsbDeviceConnection; cdecl;
    {class} procedure requestPermission(device: JUsbDevice; pi: JPendingIntent); cdecl; overload;
    {class} procedure requestPermission(accessory: JUsbAccessory; pi: JPendingIntent); cdecl; overload;
    {class} property ACTION_USB_ACCESSORY_ATTACHED: JString read _GetACTION_USB_ACCESSORY_ATTACHED;
    {class} property ACTION_USB_ACCESSORY_DETACHED: JString read _GetACTION_USB_ACCESSORY_DETACHED;
    {class} property ACTION_USB_DEVICE_ATTACHED: JString read _GetACTION_USB_DEVICE_ATTACHED;
    {class} property ACTION_USB_DEVICE_DETACHED: JString read _GetACTION_USB_DEVICE_DETACHED;
    {class} property EXTRA_ACCESSORY: JString read _GetEXTRA_ACCESSORY;
    {class} property EXTRA_DEVICE: JString read _GetEXTRA_DEVICE;
    {class} property EXTRA_PERMISSION_GRANTED: JString read _GetEXTRA_PERMISSION_GRANTED;
  end;

  [JavaSignature('android/hardware/usb/UsbManager')]
  JUsbManager = interface(JObject)
    ['{6F603A25-E816-4012-9B23-054B428A4A75}']
    function hasPermission(device: JUsbDevice): Boolean; cdecl; overload;
    function hasPermission(accessory: JUsbAccessory): Boolean; cdecl; overload;
    function openAccessory(accessory: JUsbAccessory): JParcelFileDescriptor; cdecl;
  end;
  TJUsbManager = class(TJavaGenericImport<JUsbManagerClass, JUsbManager>) end;

  JUsbRequestClass = interface(JObjectClass)
    ['{8A8E6489-7B33-4CCC-B25E-2847FD29DA80}']
    {class} function init: JUsbRequest; cdecl;
    {class} function cancel: Boolean; cdecl;//Deprecated
    {class} procedure close; cdecl;//Deprecated
    {class} function getClientData: JObject; cdecl;//Deprecated
    {class} procedure setClientData(data: JObject); cdecl;//Deprecated
  end;

  [JavaSignature('android/hardware/usb/UsbRequest')]
  JUsbRequest = interface(JObject)
    ['{C192EBAE-64F9-46FD-9E81-CB44E9D42FB1}']
    function getEndpoint: JUsbEndpoint; cdecl;//Deprecated
    function initialize(connection: JUsbDeviceConnection; endpoint: JUsbEndpoint): Boolean; cdecl;//Deprecated
    function queue(buffer: JByteBuffer; length: Integer): Boolean; cdecl;//Deprecated
  end;
  TJUsbRequest = class(TJavaGenericImport<JUsbRequestClass, JUsbRequest>) end;

  Jsatger_BuildConfigClass = interface(JObjectClass)
    ['{C44BBECA-7FAE-4510-A5AD-A0364B4A3C45}']
    {class} function _GetAPPLICATION_ID: JString; cdecl;
    {class} function _GetBUILD_TYPE: JString; cdecl;
    {class} function _GetDEBUG: Boolean; cdecl;
    {class} function _GetFLAVOR: JString; cdecl;
    {class} function _GetLIBRARY_PACKAGE_NAME: JString; cdecl;
    {class} function _GetVERSION_CODE: Integer; cdecl;
    {class} function _GetVERSION_NAME: JString; cdecl;
    {class} function init: Jsatger_BuildConfig; cdecl;//Deprecated
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/phi/gertec/sat/satger/BuildConfig')]
  Jsatger_BuildConfig = interface(JObject)
    ['{C52D81E2-DB23-4969-A604-B55E092A3BE8}']
  end;
  TJsatger_BuildConfig = class(TJavaGenericImport<Jsatger_BuildConfigClass, Jsatger_BuildConfig>) end;

  JSatGerConnectionManagerClass = interface(JObjectClass)
    ['{F458B7C4-C51C-4ACE-ADAA-E64D05E6110D}']
    {class} procedure checkForDevices; cdecl;//Deprecated
    {class} function getSatConnection: JUsbDeviceConnection; cdecl;//Deprecated
    {class} function getSatPort: JCommonUsbSerialPort; cdecl;//Deprecated
    {class} function init(P1: JContext): JSatGerConnectionManager; cdecl;//Deprecated
    {class} procedure setListener(P1: JSatGerConnectionManager_Listener); cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerConnectionManager')]
  JSatGerConnectionManager = interface(JObject)
    ['{022C4342-37B0-4A9C-A23B-565CC630F360}']
  end;
  TJSatGerConnectionManager = class(TJavaGenericImport<JSatGerConnectionManagerClass, JSatGerConnectionManager>) end;

  JSatGerConnectionManager_1Class = interface(JRunnableClass)
    ['{89869F38-00B9-438C-9168-FACBD5858D3E}']
    {class} function init(P1: JSatGerConnectionManager): JSatGerConnectionManager_1; cdecl;//Deprecated
    {class} procedure run; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerConnectionManager$1')]
  JSatGerConnectionManager_1 = interface(JRunnable)
    ['{D9438279-D71D-4E35-9A64-8D2DC8D14C3F}']
  end;
  TJSatGerConnectionManager_1 = class(TJavaGenericImport<JSatGerConnectionManager_1Class, JSatGerConnectionManager_1>) end;

  JSatGerConnectionManager_2Class = interface(JBroadcastReceiverClass)
    ['{5E07A93A-B0CF-4E60-9875-D9FAE90064D2}']
    {class} function init(P1: JSatGerConnectionManager): JSatGerConnectionManager_2; cdecl;//Deprecated
    {class} procedure onReceive(P1: JContext; P2: JIntent); cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerConnectionManager$2')]
  JSatGerConnectionManager_2 = interface(JBroadcastReceiver)
    ['{3890D48E-F70B-489E-80EA-67DAD83234CC}']
  end;
  TJSatGerConnectionManager_2 = class(TJavaGenericImport<JSatGerConnectionManager_2Class, JSatGerConnectionManager_2>) end;

  JSatGerConnectionManager_ConnectionFailedExceptionClass = interface(JExceptionClass)
    ['{A584160E-A302-4523-ADAA-AE405F1A27EB}']
    {class} function init(P1: JSatGerConnectionManager; P2: JString): JSatGerConnectionManager_ConnectionFailedException; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerConnectionManager$ConnectionFailedException')]
  JSatGerConnectionManager_ConnectionFailedException = interface(JException)
    ['{FC648004-50A3-4431-8E84-00A3BD511E49}']
  end;
  TJSatGerConnectionManager_ConnectionFailedException = class(TJavaGenericImport<JSatGerConnectionManager_ConnectionFailedExceptionClass, JSatGerConnectionManager_ConnectionFailedException>) end;

  JSatGerConnectionManager_ListenerClass = interface(IJavaClass)
    ['{1A6CA47F-03D8-457A-8C62-BAB96EAA3409}']
    {class} procedure startIoManager; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerConnectionManager$Listener')]
  JSatGerConnectionManager_Listener = interface(IJavaInstance)
    ['{B8D46AC2-7A49-45E5-97A2-BE98722B8057}']
  end;
  TJSatGerConnectionManager_Listener = class(TJavaGenericImport<JSatGerConnectionManager_ListenerClass, JSatGerConnectionManager_Listener>) end;

  JSatGerLibClass = interface(JObjectClass)
    ['{5D730845-85E7-4BDD-8D35-17F9550E3A0C}']
    {class} function AssociarAssinatura(NumeroSessao: Integer; CodigoAtivacao: JString; CNPJvalue: JString; assinaturaCNPJs: JString): JString; cdecl;//Deprecated
    {class} function AtivarSAT(NumeroSessao: Integer; subComando: Integer; CNPJ: JString; cUF: JString; P5: Integer): JString; cdecl;//Deprecated
    {class} function AtualizarSAT(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function BloquearSAT(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function CancelarUltimaVenda(NumeroSessao: Integer; CodigoAtivacao: JString; chave: JString; dadosCancelamento: JString): JString; cdecl;//Deprecated
    {class} function ConfigurarInterfaceDeRede(NumeroSessao: Integer; CodigoAtivacao: JString; dadosConfiguracao: JString): JString; cdecl;//Deprecated
    {class} function ConsultarNumeroSessao(NumeroSessao: Integer; CodigoAtivacao: JString; cNumeroDeSessao: Integer): JString; cdecl;//Deprecated
    {class} function ConsultarSAT(NumeroSessao: Integer): JString; cdecl;//Deprecated
    {class} function ConsultarStatusOperacional(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function DesbloquearSAT(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function EnviarDadosVenda(NumeroSessao: Integer; CodigoAtivacao: JString; dadosVenda: JString): JString; cdecl;//Deprecated
    {class} function ExtrairLogs(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function TesteFimAFim(NumeroSessao: Integer; CodigoAtivacao: JString; dadosVenda: JString): JString; cdecl;//Deprecated
    {class} function TrocarCodigoDeAtivacao(NumeroSessao: Integer; CodigoAtivacao: JString; opcao: Integer; novoCodigo: JString; confNovoCodigo: JString): JString; cdecl;//Deprecated
    {class} function VersaoDllGerSAT: JString; cdecl;//Deprecated
    {class} function init(main_context: JContext; onDataReceivedListener: JSatGerLib_OnDataReceived): JSatGerLib; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerLib')]
  JSatGerLib = interface(JObject)
    ['{F86C0A6D-13FB-47EC-9271-2E9D2BE929C5}']
    // Adiocionado por Geovani
    {class} function AssociarAssinatura(NumeroSessao: Integer; CodigoAtivacao: JString; CNPJvalue: JString; assinaturaCNPJs: JString): JString; cdecl;//Deprecated
    {class} function AtivarSAT(NumeroSessao: Integer; subComando: Integer; CNPJ: JString; cUF: JString; P5: Integer): JString; cdecl;//Deprecated
    {class} function AtualizarSAT(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function BloquearSAT(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function CancelarUltimaVenda(NumeroSessao: Integer; CodigoAtivacao: JString; chave: JString; dadosCancelamento: JString): JString; cdecl;//Deprecated
    {class} function ConfigurarInterfaceDeRede(NumeroSessao: Integer; CodigoAtivacao: JString; dadosConfiguracao: JString): JString; cdecl;//Deprecated
    {class} function ConsultarNumeroSessao(NumeroSessao: Integer; CodigoAtivacao: JString; cNumeroDeSessao: Integer): JString; cdecl;//Deprecated
    {class} function ConsultarSAT(NumeroSessao: Integer): JString; cdecl;//Deprecated
    {class} function ConsultarStatusOperacional(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function DesbloquearSAT(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function EnviarDadosVenda(NumeroSessao: Integer; CodigoAtivacao: JString; dadosVenda: JString): JString; cdecl;//Deprecated
    {class} function ExtrairLogs(NumeroSessao: Integer; CodigoAtivacao: JString): JString; cdecl;//Deprecated
    {class} function TesteFimAFim(NumeroSessao: Integer; CodigoAtivacao: JString; dadosVenda: JString): JString; cdecl;//Deprecated
    {class} function TrocarCodigoDeAtivacao(NumeroSessao: Integer; CodigoAtivacao: JString; opcao: Integer; novoCodigo: JString; confNovoCodigo: JString): JString; cdecl;//Deprecated
    {class} function VersaoDllGerSAT: JString; cdecl;//Deprecated
    {class} function init(main_context: JContext; onDataReceivedListener: JSatGerLib_OnDataReceived): JSatGerLib; cdecl;//Deprecated
  end;
  TJSatGerLib = class(TJavaGenericImport<JSatGerLibClass, JSatGerLib>) end;

  JSatGerLib_OnDataReceivedClass = interface(IJavaClass)
    ['{4C2A36B5-B63B-47A6-BDDB-A188924D9208}']
    {class} procedure onError(P1: JException); cdecl;//Deprecated
    {class} procedure onReceivedDataUpdate(P1: JString); cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerLib$OnDataReceived')]
  JSatGerLib_OnDataReceived = interface(IJavaInstance)
    ['{864FB0B4-FB0D-40CE-9176-72A8EC6276C8}']
    // Adicionado por Geovani
    {class} procedure onError(P1: JException); cdecl;//Deprecated
    {class} procedure onReceivedDataUpdate(P1: JString); cdecl;//Deprecated
  end;
  TJSatGerLib_OnDataReceived = class(TJavaGenericImport<JSatGerLib_OnDataReceivedClass, JSatGerLib_OnDataReceived>) end;

  JSatGerProtocolParserClass = interface(JObjectClass)
    ['{1789D9CA-54A6-46E0-BA39-834BE663CE40}']
    {class} function _GetmIOListener: JSatGerConnectionManager_Listener; cdecl;
    {class} procedure _SetmIOListener(Value: JSatGerConnectionManager_Listener); cdecl;
    {class} function _GetmListener: JSerialInputOutputManager_Listener; cdecl;
    {class} function getSerialIoManager: JSerialInputOutputManager; cdecl;//Deprecated
    {class} function init(P1: JContext; P2: JSatGerConnectionManager): JSatGerProtocolParser; cdecl;//Deprecated
    {class} function receiveSATAnswer: JString; cdecl;//Deprecated
    {class} procedure sendData(P1: JString); cdecl;//Deprecated
    {class} procedure setSerialIoManager(P1: JSerialInputOutputManager); cdecl;//Deprecated
    {class} property mIOListener: JSatGerConnectionManager_Listener read _GetmIOListener write _SetmIOListener;
    {class} property mListener: JSerialInputOutputManager_Listener read _GetmListener;
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerProtocolParser')]
  JSatGerProtocolParser = interface(JObject)
    ['{E346F245-6B13-411B-AC76-FA41ACFAE2DD}']
  end;
  TJSatGerProtocolParser = class(TJavaGenericImport<JSatGerProtocolParserClass, JSatGerProtocolParser>) end;

  JSerialInputOutputManager_ListenerClass = interface(IJavaClass)
    ['{944EBF82-3DE0-4EF2-B622-FC727E5326D7}']
    {class} function getReturnMessage: JString; cdecl;//Deprecated
    {class} function onNewData: Boolean; cdecl;//Deprecated
    {class} procedure onRunError(P1: JException); cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/SerialInputOutputManager$Listener')]
  JSerialInputOutputManager_Listener = interface(IJavaInstance)
    ['{7C92E494-ED22-4AF3-9640-6F4A9E5CB53B}']
  end;
  TJSerialInputOutputManager_Listener = class(TJavaGenericImport<JSerialInputOutputManager_ListenerClass, JSerialInputOutputManager_Listener>) end;

  JSatGerProtocolParser_1Class = interface(JSerialInputOutputManager_ListenerClass)
    ['{9AC9D450-1C5F-4B34-801B-70BEC36D912D}']
    {class} function _GetfoundEnd: Boolean; cdecl;
    {class} procedure _SetfoundEnd(Value: Boolean); cdecl;
    {class} function _GetfoundStart: Boolean; cdecl;
    {class} procedure _SetfoundStart(Value: Boolean); cdecl;
    {class} function _Getthis: JSatGerProtocolParser; cdecl;
    {class} function getReturnMessage: JString; cdecl;//Deprecated
    {class} function init(P1: JSatGerProtocolParser): JSatGerProtocolParser_1; cdecl;//Deprecated
    {class} function onNewData: Boolean; cdecl;//Deprecated
    {class} procedure onRunError(P1: JException); cdecl;//Deprecated
    {class} function parseReturnMessage(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl;//Deprecated
    {class} property foundEnd: Boolean read _GetfoundEnd write _SetfoundEnd;
    {class} property foundStart: Boolean read _GetfoundStart write _SetfoundStart;
    {class} property this: JSatGerProtocolParser read _Getthis;
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerProtocolParser$1')]
  JSatGerProtocolParser_1 = interface(JSerialInputOutputManager_Listener)
    ['{F2BB8A1A-DBC4-4C42-A72E-96FD067EB750}']
  end;
  TJSatGerProtocolParser_1 = class(TJavaGenericImport<JSatGerProtocolParser_1Class, JSatGerProtocolParser_1>) end;

  J1_1Class = interface(JRunnableClass)
    ['{F9BC7DDE-DCD5-4A2B-B30B-2978A378BF08}']
    {class} function init(P1: JSatGerProtocolParser_1): J1_1; cdecl;//Deprecated
    {class} procedure run; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerProtocolParser$1$1')]
  J1_1 = interface(JRunnable)
    ['{5FFA2283-265B-4E6A-8371-41D067BE93BD}']
  end;
  TJ1_1 = class(TJavaGenericImport<J1_1Class, J1_1>) end;

  JSatGerProtocolParser_2Class = interface(JSatGerConnectionManager_ListenerClass)
    ['{5E04EDF9-B968-4DD5-ADF5-3DDFFC910E63}']
    {class} function init(P1: JSatGerProtocolParser): JSatGerProtocolParser_2; cdecl;//Deprecated
    {class} procedure startIoManager; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/satger/SatGerProtocolParser$2')]
  JSatGerProtocolParser_2 = interface(JSatGerConnectionManager_Listener)
    ['{1D0A769C-E8A8-49AE-B73C-F6728100AD42}']
  end;
  TJSatGerProtocolParser_2 = class(TJavaGenericImport<JSatGerProtocolParser_2Class, JSatGerProtocolParser_2>) end;

  JUsbSerialDriverClass = interface(IJavaClass)
    ['{A63A58C2-158D-480C-A54C-99132E5BBC27}']
    {class} function getDevice: JUsbDevice; cdecl;//Deprecated
    {class} function getPorts: JList; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/UsbSerialDriver')]
  JUsbSerialDriver = interface(IJavaInstance)
    ['{2663F5C8-2484-4EB3-91CE-56054F821EC7}']
  end;
  TJUsbSerialDriver = class(TJavaGenericImport<JUsbSerialDriverClass, JUsbSerialDriver>) end;

  JCdcAcmSerialDriverClass = interface(JUsbSerialDriverClass)
    ['{8B9B42DB-4B5C-4B2F-A034-1538BF0EF788}']
    {class} function getDevice: JUsbDevice; cdecl;//Deprecated
    {class} function getPorts: JList; cdecl;//Deprecated
    {class} function getSupportedDevices: JMap; cdecl;//Deprecated
    {class} function init(P1: JUsbDevice): JCdcAcmSerialDriver; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/CdcAcmSerialDriver')]
  JCdcAcmSerialDriver = interface(JUsbSerialDriver)
    ['{39840AAB-913A-4391-8D4C-80DF366A9D30}']
  end;
  TJCdcAcmSerialDriver = class(TJavaGenericImport<JCdcAcmSerialDriverClass, JCdcAcmSerialDriver>) end;

  JUsbSerialPortClass = interface(IJavaClass)
    ['{A1672011-D607-46FE-8179-B6E8A9E6AFEA}']
    {class} function _GetDATABITS_5: Integer; cdecl;
    {class} function _GetDATABITS_6: Integer; cdecl;
    {class} function _GetDATABITS_7: Integer; cdecl;
    {class} function _GetDATABITS_8: Integer; cdecl;
    {class} function _GetFLOWCONTROL_NONE: Integer; cdecl;
    {class} function _GetFLOWCONTROL_RTSCTS_IN: Integer; cdecl;
    {class} function _GetFLOWCONTROL_RTSCTS_OUT: Integer; cdecl;
    {class} function _GetFLOWCONTROL_XONXOFF_IN: Integer; cdecl;
    {class} function _GetFLOWCONTROL_XONXOFF_OUT: Integer; cdecl;
    {class} function _GetPARITY_EVEN: Integer; cdecl;
    {class} function _GetPARITY_MARK: Integer; cdecl;
    {class} function _GetPARITY_NONE: Integer; cdecl;
    {class} function _GetPARITY_ODD: Integer; cdecl;
    {class} function _GetPARITY_SPACE: Integer; cdecl;
    {class} function _GetSTOPBITS_1: Integer; cdecl;
    {class} function _GetSTOPBITS_1_5: Integer; cdecl;
    {class} function _GetSTOPBITS_2: Integer; cdecl;
    {class} procedure close; cdecl;//Deprecated
    {class} function getCD: Boolean; cdecl;//Deprecated
    {class} function getCTS: Boolean; cdecl;//Deprecated
    {class} function getDSR: Boolean; cdecl;//Deprecated
    {class} function getDTR: Boolean; cdecl;//Deprecated
    {class} function getDriver: JUsbSerialDriver; cdecl;//Deprecated
    {class} function getPortNumber: Integer; cdecl;//Deprecated
    {class} function getRI: Boolean; cdecl;//Deprecated
    {class} function getRTS: Boolean; cdecl;//Deprecated
    {class} function getSerial: JString; cdecl;//Deprecated
    {class} procedure open(P1: JUsbDeviceConnection); cdecl;//Deprecated
    {class} function purgeHwBuffers(P1: Boolean; P2: Boolean): Boolean; cdecl;//Deprecated
    {class} function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} function reada(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function reada(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} procedure setDTR(P1: Boolean); cdecl;//Deprecated
    {class} procedure setParameters(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;//Deprecated
    {class} procedure setRTS(P1: Boolean); cdecl;//Deprecated
    {class} procedure startUsbReadRequest; cdecl;//Deprecated
    {class} procedure stopUsbReadRequest; cdecl;//Deprecated
    {class} function write(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} property DATABITS_5: Integer read _GetDATABITS_5;
    {class} property DATABITS_6: Integer read _GetDATABITS_6;
    {class} property DATABITS_7: Integer read _GetDATABITS_7;
    {class} property DATABITS_8: Integer read _GetDATABITS_8;
    {class} property FLOWCONTROL_NONE: Integer read _GetFLOWCONTROL_NONE;
    {class} property FLOWCONTROL_RTSCTS_IN: Integer read _GetFLOWCONTROL_RTSCTS_IN;
    {class} property FLOWCONTROL_RTSCTS_OUT: Integer read _GetFLOWCONTROL_RTSCTS_OUT;
    {class} property FLOWCONTROL_XONXOFF_IN: Integer read _GetFLOWCONTROL_XONXOFF_IN;
    {class} property FLOWCONTROL_XONXOFF_OUT: Integer read _GetFLOWCONTROL_XONXOFF_OUT;
    {class} property PARITY_EVEN: Integer read _GetPARITY_EVEN;
    {class} property PARITY_MARK: Integer read _GetPARITY_MARK;
    {class} property PARITY_NONE: Integer read _GetPARITY_NONE;
    {class} property PARITY_ODD: Integer read _GetPARITY_ODD;
    {class} property PARITY_SPACE: Integer read _GetPARITY_SPACE;
    {class} property STOPBITS_1: Integer read _GetSTOPBITS_1;
    {class} property STOPBITS_1_5: Integer read _GetSTOPBITS_1_5;
    {class} property STOPBITS_2: Integer read _GetSTOPBITS_2;
  end;

  [JavaSignature('com/phi/gertec/sat/serial/UsbSerialPort')]
  JUsbSerialPort = interface(IJavaInstance)
    ['{1998E7F9-8D8B-42C2-9B07-A0A96A09422E}']
  end;
  TJUsbSerialPort = class(TJavaGenericImport<JUsbSerialPortClass, JUsbSerialPort>) end;

  JCommonUsbSerialPortClass = interface(JUsbSerialPortClass)
    ['{9E216AFF-DE84-4550-902E-05B65E017CE8}']
    {class} function _GetDEFAULT_READ_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetDEFAULT_WRITE_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetmConnection: JUsbDeviceConnection; cdecl;
    {class} procedure _SetmConnection(Value: JUsbDeviceConnection); cdecl;
    {class} function _GetmDevice: JUsbDevice; cdecl;
    {class} function _GetmPortNumber: Integer; cdecl;
    {class} function _GetmReadBuffer: TJavaArray<Byte>; cdecl;
    {class} procedure _SetmReadBuffer(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetmReadBufferLock: JObject; cdecl;
    {class} function _GetmWriteBuffer: TJavaArray<Byte>; cdecl;
    {class} procedure _SetmWriteBuffer(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetmWriteBufferLock: JObject; cdecl;
    {class} procedure close; cdecl;//Deprecated
    {class} function getCD: Boolean; cdecl;//Deprecated
    {class} function getCTS: Boolean; cdecl;//Deprecated
    {class} function getDSR: Boolean; cdecl;//Deprecated
    {class} function getDTR: Boolean; cdecl;//Deprecated
    {class} function getDevice: JUsbDevice; cdecl;//Deprecated
    {class} function getPortNumber: Integer; cdecl;//Deprecated
    {class} function getRI: Boolean; cdecl;//Deprecated
    {class} function getRTS: Boolean; cdecl;//Deprecated
    {class} function getSerial: JString; cdecl;//Deprecated
    {class} function init(P1: JUsbDevice; P2: Integer): JCommonUsbSerialPort; cdecl;//Deprecated
    {class} procedure open(P1: JUsbDeviceConnection); cdecl;//Deprecated
    {class} function purgeHwBuffers(P1: Boolean; P2: Boolean): Boolean; cdecl;//Deprecated
    {class} function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} procedure setDTR(P1: Boolean); cdecl;//Deprecated
    {class} procedure setParameters(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;//Deprecated
    {class} procedure setRTS(P1: Boolean); cdecl;//Deprecated
    {class} procedure setReadBufferSize(P1: Integer); cdecl;//Deprecated
    {class} procedure setWriteBufferSize(P1: Integer); cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} function write(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} property DEFAULT_READ_BUFFER_SIZE: Integer read _GetDEFAULT_READ_BUFFER_SIZE;
    {class} property DEFAULT_WRITE_BUFFER_SIZE: Integer read _GetDEFAULT_WRITE_BUFFER_SIZE;
    {class} property mConnection: JUsbDeviceConnection read _GetmConnection write _SetmConnection;
    {class} property mDevice: JUsbDevice read _GetmDevice;
    {class} property mPortNumber: Integer read _GetmPortNumber;
    {class} property mReadBuffer: TJavaArray<Byte> read _GetmReadBuffer write _SetmReadBuffer;
    {class} property mReadBufferLock: JObject read _GetmReadBufferLock;
    {class} property mWriteBuffer: TJavaArray<Byte> read _GetmWriteBuffer write _SetmWriteBuffer;
    {class} property mWriteBufferLock: JObject read _GetmWriteBufferLock;
  end;

  [JavaSignature('com/phi/gertec/sat/serial/CommonUsbSerialPort')]
  JCommonUsbSerialPort = interface(JUsbSerialPort)
    ['{C591274E-0164-4EB1-90F3-624E2A883E18}']
  end;
  TJCommonUsbSerialPort = class(TJavaGenericImport<JCommonUsbSerialPortClass, JCommonUsbSerialPort>) end;

  JCdcAcmSerialDriver_CdcAcmSerialPortClass = interface(JCommonUsbSerialPortClass)
    ['{6646F0EC-FC87-4CEB-9DB5-B96164C18A1A}']
    {class} function _GetGET_LINE_CODING: Integer; cdecl;
    {class} function _GetSEND_BREAK: Integer; cdecl;
    {class} function _GetSET_CONTROL_LINE_STATE: Integer; cdecl;
    {class} function _GetSET_LINE_CODING: Integer; cdecl;
    {class} function _GetUSB_RECIP_INTERFACE: Integer; cdecl;
    {class} function _GetUSB_RT_ACM: Integer; cdecl;
    {class} function _Getthis: JCdcAcmSerialDriver; cdecl;
    {class} procedure close; cdecl;//Deprecated
    {class} function getCD: Boolean; cdecl;//Deprecated
    {class} function getCTS: Boolean; cdecl;//Deprecated
    {class} function getDSR: Boolean; cdecl;//Deprecated
    {class} function getDTR: Boolean; cdecl;//Deprecated
    {class} function getDriver: JUsbSerialDriver; cdecl;//Deprecated
    {class} function getRI: Boolean; cdecl;//Deprecated
    {class} function getRTS: Boolean; cdecl;//Deprecated
    {class} function init(P1: JCdcAcmSerialDriver; P2: JUsbDevice; P3: Integer): JCdcAcmSerialDriver_CdcAcmSerialPort; cdecl;//Deprecated
    {class} procedure open(P1: JUsbDeviceConnection); cdecl;//Deprecated
    {class} function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} function reada(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function reada(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} procedure setDTR(P1: Boolean); cdecl;//Deprecated
    {class} procedure setParameters(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;//Deprecated
    {class} procedure setRTS(P1: Boolean); cdecl;//Deprecated
    {class} procedure startUsbReadRequest; cdecl;//Deprecated
    {class} procedure stopUsbReadRequest; cdecl;//Deprecated
    {class} function write(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} function writea(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} property GET_LINE_CODING: Integer read _GetGET_LINE_CODING;
    {class} property SEND_BREAK: Integer read _GetSEND_BREAK;
    {class} property SET_CONTROL_LINE_STATE: Integer read _GetSET_CONTROL_LINE_STATE;
    {class} property SET_LINE_CODING: Integer read _GetSET_LINE_CODING;
    {class} property USB_RECIP_INTERFACE: Integer read _GetUSB_RECIP_INTERFACE;
    {class} property USB_RT_ACM: Integer read _GetUSB_RT_ACM;
    {class} property this: JCdcAcmSerialDriver read _Getthis;
  end;

  [JavaSignature('com/phi/gertec/sat/serial/CdcAcmSerialDriver$CdcAcmSerialPort')]
  JCdcAcmSerialDriver_CdcAcmSerialPort = interface(JCommonUsbSerialPort)
    ['{A23384B8-769C-42C0-84BF-80BBC6F096F8}']
  end;
  TJCdcAcmSerialDriver_CdcAcmSerialPort = class(TJavaGenericImport<JCdcAcmSerialDriver_CdcAcmSerialPortClass, JCdcAcmSerialDriver_CdcAcmSerialPort>) end;

  JHexDumpClass = interface(JObjectClass)
    ['{598A2B33-992F-43AE-B2A6-F8270069A3DE}']
    {class} function dumpHexString(P1: TJavaArray<Byte>): JString; cdecl; overload;//Deprecated
    {class} function dumpHexString(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;//Deprecated
    {class} function hexStringToByteArray(P1: JString): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function init: JHexDump; cdecl;//Deprecated
    {class} function toByteArray(P1: Byte): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function toByteArray(P1: Integer): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function toByteArray(P1: SmallInt): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function toHexString(P1: SmallInt): JString; cdecl; overload;//Deprecated
    {class} function toHexString(P1: Byte): JString; cdecl; overload;//Deprecated
    {class} function toHexString(P1: TJavaArray<Byte>): JString; cdecl; overload;//Deprecated
    {class} function toHexString(P1: Integer): JString; cdecl; overload;//Deprecated
    {class} function toHexString(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/HexDump')]
  JHexDump = interface(JObject)
    ['{505CA546-850D-4204-9289-6A33A09BFD9C}']
  end;
  TJHexDump = class(TJavaGenericImport<JHexDumpClass, JHexDump>) end;

  JProbeTableClass = interface(JObjectClass)
    ['{8327423E-CA7A-45FE-90CC-959020A4D125}']
    {class} function addProduct(P1: Integer; P2: Integer; P3: Jlang_Class): JProbeTable; cdecl;//Deprecated
    {class} function findDriver(P1: Integer; P2: Integer): Jlang_Class; cdecl;//Deprecated
    {class} function init: JProbeTable; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/ProbeTable')]
  JProbeTable = interface(JObject)
    ['{AA9F1A05-FA53-495E-B3F8-92EEB8FFD377}']
  end;
  TJProbeTable = class(TJavaGenericImport<JProbeTableClass, JProbeTable>) end;

  JSerialInputOutputManagerClass = interface(JRunnableClass)
    ['{2AECFF7F-59A7-471C-9158-866D909D9AEF}']
    {class} function getListener: JSerialInputOutputManager_Listener; cdecl;//Deprecated
    {class} function getState: JSerialInputOutputManager_State; cdecl;//Deprecated
    {class} function init(P1: JCommonUsbSerialPort): JSerialInputOutputManager; cdecl; overload;//Deprecated
    {class} function init(P1: JCommonUsbSerialPort; P2: JSerialInputOutputManager_Listener): JSerialInputOutputManager; cdecl; overload;//Deprecated
    {class} procedure run; cdecl;//Deprecated
    {class} procedure setListener(P1: JSerialInputOutputManager_Listener); cdecl;//Deprecated
    {class} procedure setState(P1: JSerialInputOutputManager_State); cdecl;//Deprecated
    {class} procedure stop; cdecl;//Deprecated
    {class} function writeAck: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/SerialInputOutputManager')]
  JSerialInputOutputManager = interface(JRunnable)
    ['{4A90017A-3924-4559-8301-5106FAF9828F}']
  end;
  TJSerialInputOutputManager = class(TJavaGenericImport<JSerialInputOutputManagerClass, JSerialInputOutputManager>) end;

  JSerialInputOutputManager_StateClass = interface(JEnumClass)
    ['{08FDFA2E-A4F4-4945-94D7-23208290D024}']
    {class} function _GetSTANDBY: JSerialInputOutputManager_State; cdecl;
    {class} function _GetSTOPPED: JSerialInputOutputManager_State; cdecl;
    {class} function _GetSTOPPING: JSerialInputOutputManager_State; cdecl;
    {class} function _GetWAITING_ACK: JSerialInputOutputManager_State; cdecl;
    {class} function _GetWAITING_MSG: JSerialInputOutputManager_State; cdecl;
    {class} function valueOf(P1: JString): JSerialInputOutputManager_State; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JSerialInputOutputManager_State>; cdecl;//Deprecated
    {class} property STANDBY: JSerialInputOutputManager_State read _GetSTANDBY;
    {class} property STOPPED: JSerialInputOutputManager_State read _GetSTOPPED;
    {class} property STOPPING: JSerialInputOutputManager_State read _GetSTOPPING;
    {class} property WAITING_ACK: JSerialInputOutputManager_State read _GetWAITING_ACK;
    {class} property WAITING_MSG: JSerialInputOutputManager_State read _GetWAITING_MSG;
  end;

  [JavaSignature('com/phi/gertec/sat/serial/SerialInputOutputManager$State')]
  JSerialInputOutputManager_State = interface(JEnum)
    ['{1E87C286-F6E9-4FB7-8211-A01F1D5C80FC}']
  end;
  TJSerialInputOutputManager_State = class(TJavaGenericImport<JSerialInputOutputManager_StateClass, JSerialInputOutputManager_State>) end;

  JUsbIdClass = interface(JObjectClass)
    ['{A25D4A76-8D10-4394-B4D5-FC0871D04A5B}']
    {class} function _GetARDUINO_LEONARDO: Integer; cdecl;
    {class} function _GetARDUINO_MEGA_2560: Integer; cdecl;
    {class} function _GetARDUINO_MEGA_2560_R3: Integer; cdecl;
    {class} function _GetARDUINO_MEGA_ADK: Integer; cdecl;
    {class} function _GetARDUINO_MEGA_ADK_R3: Integer; cdecl;
    {class} function _GetARDUINO_SERIAL_ADAPTER: Integer; cdecl;
    {class} function _GetARDUINO_SERIAL_ADAPTER_R3: Integer; cdecl;
    {class} function _GetARDUINO_UNO: Integer; cdecl;
    {class} function _GetARDUINO_UNO_R3: Integer; cdecl;
    {class} function _GetATMEL_LUFA_CDC_DEMO_APP: Integer; cdecl;
    {class} function _GetFTDI_FT231X: Integer; cdecl;
    {class} function _GetFTDI_FT232R: Integer; cdecl;
    {class} function _GetGERTEC_GERSAT_PID: Integer; cdecl;
    {class} function _GetGERTEC_SATA10_PID: Integer; cdecl;
    {class} function _GetGERTEC_VID: Integer; cdecl;
    {class} function _GetLEAFLABS_MAPLE: Integer; cdecl;
    {class} function _GetPROLIFIC_PL2303: Integer; cdecl;
    {class} function _GetSILABS_CP2102: Integer; cdecl;
    {class} function _GetSILABS_CP2105: Integer; cdecl;
    {class} function _GetSILABS_CP2108: Integer; cdecl;
    {class} function _GetSILABS_CP2110: Integer; cdecl;
    {class} function _GetVAN_OOIJEN_TECH_TEENSYDUINO_SERIAL: Integer; cdecl;
    {class} function _GetVENDOR_ARDUINO: Integer; cdecl;
    {class} function _GetVENDOR_ATMEL: Integer; cdecl;
    {class} function _GetVENDOR_FTDI: Integer; cdecl;
    {class} function _GetVENDOR_LEAFLABS: Integer; cdecl;
    {class} function _GetVENDOR_PROLIFIC: Integer; cdecl;
    {class} function _GetVENDOR_SILABS: Integer; cdecl;
    {class} function _GetVENDOR_VAN_OOIJEN_TECH: Integer; cdecl;
    {class} property ARDUINO_LEONARDO: Integer read _GetARDUINO_LEONARDO;
    {class} property ARDUINO_MEGA_2560: Integer read _GetARDUINO_MEGA_2560;
    {class} property ARDUINO_MEGA_2560_R3: Integer read _GetARDUINO_MEGA_2560_R3;
    {class} property ARDUINO_MEGA_ADK: Integer read _GetARDUINO_MEGA_ADK;
    {class} property ARDUINO_MEGA_ADK_R3: Integer read _GetARDUINO_MEGA_ADK_R3;
    {class} property ARDUINO_SERIAL_ADAPTER: Integer read _GetARDUINO_SERIAL_ADAPTER;
    {class} property ARDUINO_SERIAL_ADAPTER_R3: Integer read _GetARDUINO_SERIAL_ADAPTER_R3;
    {class} property ARDUINO_UNO: Integer read _GetARDUINO_UNO;
    {class} property ARDUINO_UNO_R3: Integer read _GetARDUINO_UNO_R3;
    {class} property ATMEL_LUFA_CDC_DEMO_APP: Integer read _GetATMEL_LUFA_CDC_DEMO_APP;
    {class} property FTDI_FT231X: Integer read _GetFTDI_FT231X;
    {class} property FTDI_FT232R: Integer read _GetFTDI_FT232R;
    {class} property GERTEC_GERSAT_PID: Integer read _GetGERTEC_GERSAT_PID;
    {class} property GERTEC_SATA10_PID: Integer read _GetGERTEC_SATA10_PID;
    {class} property GERTEC_VID: Integer read _GetGERTEC_VID;
    {class} property LEAFLABS_MAPLE: Integer read _GetLEAFLABS_MAPLE;
    {class} property PROLIFIC_PL2303: Integer read _GetPROLIFIC_PL2303;
    {class} property SILABS_CP2102: Integer read _GetSILABS_CP2102;
    {class} property SILABS_CP2105: Integer read _GetSILABS_CP2105;
    {class} property SILABS_CP2108: Integer read _GetSILABS_CP2108;
    {class} property SILABS_CP2110: Integer read _GetSILABS_CP2110;
    {class} property VAN_OOIJEN_TECH_TEENSYDUINO_SERIAL: Integer read _GetVAN_OOIJEN_TECH_TEENSYDUINO_SERIAL;
    {class} property VENDOR_ARDUINO: Integer read _GetVENDOR_ARDUINO;
    {class} property VENDOR_ATMEL: Integer read _GetVENDOR_ATMEL;
    {class} property VENDOR_FTDI: Integer read _GetVENDOR_FTDI;
    {class} property VENDOR_LEAFLABS: Integer read _GetVENDOR_LEAFLABS;
    {class} property VENDOR_PROLIFIC: Integer read _GetVENDOR_PROLIFIC;
    {class} property VENDOR_SILABS: Integer read _GetVENDOR_SILABS;
    {class} property VENDOR_VAN_OOIJEN_TECH: Integer read _GetVENDOR_VAN_OOIJEN_TECH;
  end;

  [JavaSignature('com/phi/gertec/sat/serial/UsbId')]
  JUsbId = interface(JObject)
    ['{2321EF42-6822-4B65-B1B4-4F7D9E7B96BF}']
  end;
  TJUsbId = class(TJavaGenericImport<JUsbIdClass, JUsbId>) end;

  JUsbSerialProberClass = interface(JObjectClass)
    ['{5F366010-1AE6-4821-8E7F-E5F8535ACE1E}']
    {class} function findAllDrivers(P1: JUsbManager): JList; cdecl;//Deprecated
    {class} function getDefaultProbeTable: JProbeTable; cdecl;//Deprecated
    {class} function getDefaultProber: JUsbSerialProber; cdecl;//Deprecated
    {class} function init(P1: JProbeTable): JUsbSerialProber; cdecl;//Deprecated
    {class} function probeDevice(P1: JUsbDevice): JUsbSerialDriver; cdecl;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/UsbSerialProber')]
  JUsbSerialProber = interface(JObject)
    ['{B91CE3BD-BE42-4A1F-B6D3-A3DC4291F6EF}']
  end;
  TJUsbSerialProber = class(TJavaGenericImport<JUsbSerialProberClass, JUsbSerialProber>) end;

  JUsbSerialRuntimeExceptionClass = interface(JRuntimeExceptionClass)
    ['{DF0011CF-00F4-4780-A43A-B62006130B4A}']
    {class} function init: JUsbSerialRuntimeException; cdecl; overload;//Deprecated
    {class} function init(P1: JString): JUsbSerialRuntimeException; cdecl; overload;//Deprecated
    {class} function init(P1: JThrowable): JUsbSerialRuntimeException; cdecl; overload;//Deprecated
    {class} function init(P1: JString; P2: JThrowable): JUsbSerialRuntimeException; cdecl; overload;//Deprecated
  end;

  [JavaSignature('com/phi/gertec/sat/serial/UsbSerialRuntimeException')]
  JUsbSerialRuntimeException = interface(JRuntimeException)
    ['{0EA36D4C-BD30-4393-877B-F8C1E32D96D1}']
  end;
  TJUsbSerialRuntimeException = class(TJavaGenericImport<JUsbSerialRuntimeExceptionClass, JUsbSerialRuntimeException>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbAccessory', TypeInfo(JavaInterfacesNew.JUsbAccessory));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbConfiguration', TypeInfo(JavaInterfacesNew.JUsbConfiguration));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbDevice', TypeInfo(JavaInterfacesNew.JUsbDevice));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbDeviceConnection', TypeInfo(JavaInterfacesNew.JUsbDeviceConnection));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbEndpoint', TypeInfo(JavaInterfacesNew.JUsbEndpoint));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbInterface', TypeInfo(JavaInterfacesNew.JUsbInterface));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbManager', TypeInfo(JavaInterfacesNew.JUsbManager));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbRequest', TypeInfo(JavaInterfacesNew.JUsbRequest));
  TRegTypes.RegisterType('JavaInterfacesNew.Jsatger_BuildConfig', TypeInfo(JavaInterfacesNew.Jsatger_BuildConfig));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerConnectionManager', TypeInfo(JavaInterfacesNew.JSatGerConnectionManager));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerConnectionManager_1', TypeInfo(JavaInterfacesNew.JSatGerConnectionManager_1));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerConnectionManager_2', TypeInfo(JavaInterfacesNew.JSatGerConnectionManager_2));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerConnectionManager_ConnectionFailedException', TypeInfo(JavaInterfacesNew.JSatGerConnectionManager_ConnectionFailedException));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerConnectionManager_Listener', TypeInfo(JavaInterfacesNew.JSatGerConnectionManager_Listener));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerLib', TypeInfo(JavaInterfacesNew.JSatGerLib));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerLib_OnDataReceived', TypeInfo(JavaInterfacesNew.JSatGerLib_OnDataReceived));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerProtocolParser', TypeInfo(JavaInterfacesNew.JSatGerProtocolParser));
  TRegTypes.RegisterType('JavaInterfacesNew.JSerialInputOutputManager_Listener', TypeInfo(JavaInterfacesNew.JSerialInputOutputManager_Listener));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerProtocolParser_1', TypeInfo(JavaInterfacesNew.JSatGerProtocolParser_1));
  TRegTypes.RegisterType('JavaInterfacesNew.J1_1', TypeInfo(JavaInterfacesNew.J1_1));
  TRegTypes.RegisterType('JavaInterfacesNew.JSatGerProtocolParser_2', TypeInfo(JavaInterfacesNew.JSatGerProtocolParser_2));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbSerialDriver', TypeInfo(JavaInterfacesNew.JUsbSerialDriver));
  TRegTypes.RegisterType('JavaInterfacesNew.JCdcAcmSerialDriver', TypeInfo(JavaInterfacesNew.JCdcAcmSerialDriver));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbSerialPort', TypeInfo(JavaInterfacesNew.JUsbSerialPort));
  TRegTypes.RegisterType('JavaInterfacesNew.JCommonUsbSerialPort', TypeInfo(JavaInterfacesNew.JCommonUsbSerialPort));
  TRegTypes.RegisterType('JavaInterfacesNew.JCdcAcmSerialDriver_CdcAcmSerialPort', TypeInfo(JavaInterfacesNew.JCdcAcmSerialDriver_CdcAcmSerialPort));
  TRegTypes.RegisterType('JavaInterfacesNew.JHexDump', TypeInfo(JavaInterfacesNew.JHexDump));
  TRegTypes.RegisterType('JavaInterfacesNew.JProbeTable', TypeInfo(JavaInterfacesNew.JProbeTable));
  TRegTypes.RegisterType('JavaInterfacesNew.JSerialInputOutputManager', TypeInfo(JavaInterfacesNew.JSerialInputOutputManager));
  TRegTypes.RegisterType('JavaInterfacesNew.JSerialInputOutputManager_State', TypeInfo(JavaInterfacesNew.JSerialInputOutputManager_State));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbId', TypeInfo(JavaInterfacesNew.JUsbId));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbSerialProber', TypeInfo(JavaInterfacesNew.JUsbSerialProber));
  TRegTypes.RegisterType('JavaInterfacesNew.JUsbSerialRuntimeException', TypeInfo(JavaInterfacesNew.JUsbSerialRuntimeException));
end;

initialization
  RegisterTypes;
end.

