unit GEDIPrinter;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Graphics,
  FMX.Dialogs,
  {$IFDEF __G800__}
  G800Interface,
  {$ELSE}
  G700Interface,
  {$ENDIF}

  System.Threading,


  FMX.Helpers.Android,
  FMX.Surfaces,
  FMX.FontGlyphs,
  Androidapi.JNI.GraphicsContentViewText,
  System.IOUtils,

  Androidapi.Helpers,
  Androidapi.JNI.App,
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes;

type


 T_ALINHAMENTO = (DIREITA, ESQUERDA, CENTRALIZADO);

 TGEDIPrinter = class
  private
    { private declarations }
    printInitFlag:integer;
    iGEDI:JIGEDI;
    iPRNTR:JIPRNTR;

  protected
    { protected declarations }
  public
  
    { public declarations }
    
    
    Alignment:T_ALINHAMENTO;

    FlagBold:boolean;
    FlagItalico:boolean;
    FlagSublinhado:boolean;

    lineSpace :integer;

    textSize:Single;

    textFamily:integer; //new

    teste: integer;
    

    procedure PrintString(strPrint:string); overload;
    procedure PrintString(Alinhamento:T_ALINHAMENTO;strPrint:string);overload;
    procedure fPrintString(FlagBold:boolean;strPrint:string);                   overload;
    procedure fPrintString(strPrint:string);                 overload;
    procedure PrintStringBold(strPrint:string);

    procedure printBlankLine(height:integer);

    procedure DrawBarCode(barCodeType:JGEDI_PRNTR_e_BarCodeType; Height,Width:integer;texto:String);
    procedure printInit;
    procedure printOutput;
    procedure printReInit;
    procedure printImage(Imagem:TBitmap);
    procedure printCupom(FlagBold:boolean;CupomImpresso:string);
    procedure printCupom2(FlagBold:boolean;CupomImpresso:string;BlankLines:integer);

    function StatusImpressora(): String;
    function RetornaStatus(tipoStatus: JGEDI_PRNTR_e_Status):string;


    constructor Create;

  end;

var

  GertecPrinter:TGEDIPrinter;
  aTask:ITask;

implementation

//****************************************************
function BitmapToJBitmap(const ABitmap: TBitmap): JBitmap;
//Utilizado como referencia
//https://forums.embarcadero.com/thread.jspa?threadID=245452&tstart=0
var
  LSurface: TBitmapSurface;
  LBitmap : JBitmap;

begin
  try

    LSurface := TBitmapSurface.Create;

    LSurface.Assign(ABitmap);
    LBitmap := TJBitmap.JavaClass.createBitmap(LSurface.Width, LSurface.Height, TJBitmap_Config.JavaClass.ARGB_8888);
    if SurfaceToJBitmap(LSurface, LBitmap)then
      result:= LBitmap
    else
      result:= nil;
  finally
    LSurface.Free;
  end;

end;
//****************************************************

//Métodos de Captura do Estado do papel pelo sensor da máquina e aquecimento
function TGEDIPrinter.RetornaStatus(tipoStatus: JGEDI_PRNTR_e_Status):string;
begin
  case tipoStatus.ordinal of
    0: result:= 'IMPRESSORA OK' ;
    1: result:= 'SUPER AQUECIMENTO' ;
    2: result:= 'SEM PAPEL' ;
    3: result:= 'ERRO DESCONHECIDO' ;

  end;
end;

function TGEDIPrinter.StatusImpressora(): String;
begin
  Result:= RetornaStatus(iPRNTR.Status);
end;

//****************************************************
constructor TGEDIPrinter.Create;
begin

    Alignment:= CENTRALIZADO;
    FlagBold:=False;
    FlagItalico:=False;
    FlagSublinhado:=False;

    lineSpace := 10;
    textSize:=20;

    TextFamily:=0; //new

    teste:=0;

end;
//****************************************************
procedure TGEDIPrinter.PrintString(strPrint:string);
var
  Config: JGEDI_PRNTR_st_StringConfig;
  spaint : JPaint;
  style:Integer;
  family:JTypeface;
  TypefaceFlag: Integer;
  Typeface: JTypeface;
  NomeFonte:string;
begin

  spaint:= TJPaint.Create;
  spaint.setTextSize(textSize);
  case Alignment of
    DIREITA: spaint.setTextAlign(TJPaint_Align.JavaClass.RIGHT);
    ESQUERDA: spaint.setTextAlign(TJPaint_Align.JavaClass.LEFT);
    CENTRALIZADO: spaint.setTextAlign(TJPaint_Align.JavaClass.CENTER);
  end;

  Config := TJGEDI_PRNTR_st_StringConfig.Create;

  Config.lineSpace := lineSpace;
  Config.offset := 0;
  Config.paint := spaint;

  if(FlagBold)then begin

    if(FlagItalico)then
      style :=TJTypeface.JavaClass.BOLD_ITALIC
    else
      style :=TJTypeface.JavaClass.BOLD;

  end else begin
    if(FlagItalico)then
      style :=TJTypeface.JavaClass.ITALIC
    else
      style :=TJTypeface.JavaClass.NORMAL;
  end;

  if(FlagSublinhado)then
    spaint.setFlags(TJPaint.JavaClass.UNDERLINE_TEXT_FLAG);

  //new Font Family Text
  //********************************************
    NomeFonte:=  TPath.Combine( TPath.GetDocumentsPath , 'Antro Vectra.otf');

  if (TextFamily = 0) then
    begin
    family := TJTypeface.JavaClass.DEFAULT;
  end else if(TextFamily = 1) then
    begin
    family := TJTypeface.JavaClass.MONOSPACE;
  end else if(TextFamily = 2) then
    begin
    family := TJTypeface.JavaClass.SANS_SERIF;
  end else if(TextFamily = 3) then
    begin
    family := TJTypeface.JavaClass.SERIF;
  end else if(TextFamily = 4) then
    begin
    family := TJTypeFace.JavaClass.createFromFile(StringToJString(NomeFonte));
  end;
  //********************************************

  spaint.setTypeface(TJTypeface.JavaClass.create(family,style));

  printInit;
  iPRNTR.DrawStringExt(Config,StringToJString(strPrint));

end;

procedure TGEDIPrinter.fPrintString(FlagBold:boolean;strPrint:string);
var
  Config: JGEDI_PRNTR_st_StringConfig;
  spaint : JPaint;
  style:Integer;

begin

  spaint:= TJPaint.Create;
  spaint.setTextSize(17);

  Config := TJGEDI_PRNTR_st_StringConfig.Create;

  Config.lineSpace := 1;
  Config.offset := 0;
  Config.paint := spaint;

  if(FlagBold)then
    style :=TJTypeface.JavaClass.BOLD
  else
    style :=TJTypeface.JavaClass.NORMAL;

  spaint.setTypeface(TJTypeface.JavaClass.create(TJTypeface.JavaClass.MONOSPACE,style));

  printInit;
  iPRNTR.DrawStringExt(Config,StringToJString(strPrint));

end;

//****************************************************
procedure TGEDIPrinter.PrintString(Alinhamento:T_ALINHAMENTO;strPrint:string);
begin
  Alignment:=Alinhamento;
  PrintString(strPrint);
end;

//****************************************************
procedure TGEDIPrinter.printBlankLine(height:integer);
begin
  printInit;
  iPRNTR.DrawBlankLine(height);
end;

//****************************************************
procedure TGEDIPrinter.printInit;
begin
  if(printInitFlag=0)then
    iPRNTR.Init;
  printInitFlag := 1;
end;

//****************************************************
procedure TGEDIPrinter.printReInit;
begin
  printInitFlag := 0;
end;

//****************************************************
procedure TGEDIPrinter.printOutput;
begin
  iPRNTR.Output;
  printInitFlag := 0;
end;

//****************************************************
procedure TGEDIPrinter.DrawBarCode(barCodeType:JGEDI_PRNTR_e_BarCodeType; Height,Width:integer;texto:String);
var
  BarCodeConfig : JGEDI_PRNTR_st_BarCodeConfig;
begin
try
  BarCodeConfig := TJGEDI_PRNTR_st_BarCodeConfig.Create;
  BarCodeConfig.barCodeType := barCodeType;
  BarCodeConfig.width := Width;
  BarCodeConfig.height := Height;
  printInit;
  iPRNTR.DrawBarCode( BarCodeConfig,StringToJString(texto));
except
    on e: exception do begin
      ShowMessage('Erro printBarCode=>'+e.Message);
  end;
end;

end;

//****************************************************
procedure TGEDIPrinter.printImage(Imagem:TBitmap);
var
imageConfig: JGEDI_PRNTR_st_PictureConfig;
begin

try
  imageConfig := TJGEDI_PRNTR_st_PictureConfig.Create;

  imageConfig.alignment := TJGEDI_PRNTR_e_Alignment.JavaClass.CENTER;

  //Somente G700
  //ImageConfig.offset:=0;
  imageConfig.height := 130;
  imageConfig.width := 300;
  printInit;
  iPRNTR.DrawPictureExt(imageConfig,BitmapToJBitmap(Imagem));

except
    on e: exception do begin
      ShowMessage('Erro printImage=>'+e.Message);
  end;
end;
end;

//****************************************************
procedure TGEDIPrinter.printCupom(FlagBold:boolean;CupomImpresso:string);
var
  lenAux,curPos,LastPos:integer;
begin
  try
    curPos:=1;
    LastPos:=1;
    while(curPos>0)do begin
      curPos:=Pos(#10,CupomImpresso,LastPos);
      if(curPos>0)then begin
        lenAux :=curPos-LastPos;
        if(lenAux>0)then
          fPrintString(FlagBold,copy(CupomImpresso,LastPos,lenAux))
        else
          fPrintString(FlagBold,' ');
        LastPos:=curPos+1;
      end;
    end;
    printBlankLine(150);
    printOutput;
  finally

  end;
end;
procedure TGEDIPrinter.printCupom2(FlagBold:boolean;CupomImpresso:string;BlankLines:integer);
var
  lenAux,curPos,LastPos:integer;
begin

  if(Trim(CupomImpresso)='')then
    exit;

  try
    curPos:=1;
    LastPos:=1;
    while(curPos>0)do begin
      curPos:=Pos(#10,CupomImpresso,LastPos);
      if(curPos>0)then begin
        lenAux :=curPos-LastPos;
        if(lenAux>0)then
          fPrintString(FlagBold,copy(CupomImpresso,LastPos,lenAux))
        else
          fPrintString(FlagBold,' ');
        LastPos:=curPos+1;
      end;
    end;
    printBlankLine(BlankLines);
    printOutput;
  finally

  end;
end;

procedure TGEDIPrinter.fPrintString(strPrint:string);
begin
  fPrintString(false,strPrint);
end;
//****************************************************
procedure TGEDIPrinter.PrintStringBold(strPrint:string);
begin
  fPrintString(true,strPrint);
end;
//****************************************************

//****************************************************
initialization

  GertecPrinter:=TGEDIPrinter.Create;
  GertecPrinter.printInitFlag := 0;
  aTask := TTask.Create(procedure ()
  begin
    GertecPrinter.iGEDI := TJGEDI.JavaClass.getInstance(TAndroidHelper.Activity);
    GertecPrinter.iPRNTR := TJGEDI.JavaClass.getInstance(TAndroidHelper.Activity).getPRNTR;
  end);

  aTask.Start;
end.
