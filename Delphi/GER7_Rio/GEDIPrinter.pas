unit GEDIPrinter;

{$DEFINE __GPOS700__}

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Graphics,
  FMX.Dialogs,
  {$IFDEF __GPOS700__}
  G700Interface,
  {$ELSE}
  G800Interface,
  {$ENDIF}
  System.Threading,


  FMX.Helpers.Android,
  FMX.Surfaces,
  FMX.FontGlyphs,
  Androidapi.JNI.GraphicsContentViewText,
  System.IOUtils,

  //FMX.Edit,


  Androidapi.Helpers,
  Androidapi.JNI.App,
  AndroidAPI.JNIBridge,
  Androidapi.JNI.JavaTypes;



var
  iGEDI:JIGEDI;
  iPRNTR:JIPRNTR;
  printInitFlag:integer;
  aTask:ITask;

procedure fPrintString(FlagBold:boolean;strPrint:string);
procedure PrintString(strPrint:string);
procedure PrintStringBold(strPrint:string);
procedure printBlankLine(height:integer);
procedure DrawBarCode(barCodeType:JGEDI_PRNTR_e_BarCodeType; Height,Width:integer;texto:String);
procedure printInit;
procedure printOutput;
procedure printImage(Imagem:TBitmap);
procedure printCupom(FlagBold:boolean;CupomImpresso:string);
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

  end;

end;

//****************************************************
procedure PrintString(strPrint:string);
begin
  fPrintString(false,strPrint);
end;
//****************************************************
procedure PrintStringBold(strPrint:string);
begin
  fPrintString(true,strPrint);
end;
//****************************************************
procedure fPrintString(FlagBold:boolean;strPrint:string);
var
  Config: JGEDI_PRNTR_st_StringConfig;
  spaint : JPaint;
  style:Integer;

begin

  spaint:= TJPaint.Create;
  spaint.setTextSize(15);

  Config := TJGEDI_PRNTR_st_StringConfig.Create;

  Config.lineSpace := 0;
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
procedure printBlankLine(height:integer);
begin
  printInit;
  iPRNTR.DrawBlankLine(height);
end;
//****************************************************
procedure printInit;
begin
  if(printInitFlag=0)then
    iPRNTR.Init;
  printInitFlag := 1;
end;
//****************************************************
procedure printOutput;
begin
  iPRNTR.Output;
  printInitFlag := 0;
end;
//****************************************************
procedure DrawBarCode(barCodeType:JGEDI_PRNTR_e_BarCodeType; Height,Width:integer;texto:String);
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
procedure printImage(Imagem:TBitmap);
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
procedure printCupom(FlagBold:boolean;CupomImpresso:string);
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
//****************************************************

initialization


  printInitFlag := 0;
  aTask := TTask.Create(procedure ()
    begin
    iGEDI := TJGEDI.JavaClass.getInstance(TAndroidHelper.Activity);
    iPRNTR := TJGEDI.JavaClass.getInstance(TAndroidHelper.Activity).getPRNTR;
    end);

  aTask.Start;

end.
