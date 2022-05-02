program GertecOne_G700;





{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {frmMain},
  Androidapi.JNI.Toast in 'Lib\Androidapi.JNI.Toast.pas',
  FMX.Barcode.DROID in 'Lib\FMX.Barcode.DROID.pas',
  FMX.Barcode.IOS in 'Lib\FMX.Barcode.IOS.pas',
  ZXing.ScanManager in 'Lib\ZXing.ScanManager.pas',
  ZXing.OneD.Code39Reader in 'Lib\1D Barcodes\ZXing.OneD.Code39Reader.pas',
  ZXing.OneD.Code93Reader in 'Lib\1D Barcodes\ZXing.OneD.Code93Reader.pas',
  ZXing.OneD.Code128Reader in 'Lib\1D Barcodes\ZXing.OneD.Code128Reader.pas',
  ZXing.OneD.EAN8Reader in 'Lib\1D Barcodes\ZXing.OneD.EAN8Reader.pas',
  ZXing.OneD.EAN13Reader in 'Lib\1D Barcodes\ZXing.OneD.EAN13Reader.pas',
  ZXing.OneD.EANManufacturerOrgSupport in 'Lib\1D Barcodes\ZXing.OneD.EANManufacturerOrgSupport.pas',
  ZXing.OneD.ITFReader in 'Lib\1D Barcodes\ZXing.OneD.ITFReader.pas',
  ZXing.OneD.OneDReader in 'Lib\1D Barcodes\ZXing.OneD.OneDReader.pas',
  ZXing.OneD.UPCAReader in 'Lib\1D Barcodes\ZXing.OneD.UPCAReader.pas',
  ZXing.OneD.UPCEANExtension2Support in 'Lib\1D Barcodes\ZXing.OneD.UPCEANExtension2Support.pas',
  ZXing.OneD.UPCEANExtension5Support in 'Lib\1D Barcodes\ZXing.OneD.UPCEANExtension5Support.pas',
  ZXing.OneD.UPCEANExtensionSupport in 'Lib\1D Barcodes\ZXing.OneD.UPCEANExtensionSupport.pas',
  ZXing.OneD.UPCEANReader in 'Lib\1D Barcodes\ZXing.OneD.UPCEANReader.pas',
  ZXing.OneD.UPCEReader in 'Lib\1D Barcodes\ZXing.OneD.UPCEReader.pas',
  ZXing.Datamatrix.Internal.BitMatrixParser in 'Lib\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.BitMatrixParser.pas',
  ZXing.Datamatrix.Internal.DataBlock in 'Lib\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DataBlock.pas',
  ZXing.Datamatrix.Internal.DecodedBitStreamParser in 'Lib\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DecodedBitStreamParser.pas',
  ZXing.Datamatrix.Internal.Decoder in 'Lib\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Decoder.pas',
  ZXing.Datamatrix.Internal.Version in 'Lib\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Version.pas',
  ZXing.QrCode.Internal.BitMatrixParser in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.BitMatrixParser.pas',
  ZXing.QrCode.Internal.DataBlock in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataBlock.pas',
  ZXing.QrCode.Internal.DataMask in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataMask.pas',
  ZXing.QrCode.Internal.DecodedBitStreamParser in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.DecodedBitStreamParser.pas',
  ZXing.QrCode.Internal.Decoder in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.Decoder.pas',
  ZXing.QrCode.Internal.ErrorCorrectionLevel in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.ErrorCorrectionLevel.pas',
  ZXing.QrCode.Internal.FormatInformation in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.FormatInformation.pas',
  ZXing.QrCode.Internal.Mode in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.Mode.pas',
  ZXing.QrCode.Internal.QRCodeDecoderMetaData in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.QRCodeDecoderMetaData.pas',
  ZXing.QrCode.Internal.Version in 'Lib\2D Barcodes\Decoder\ZXing.QrCode.Internal.Version.pas',
  ZXing.Datamatrix.Internal.Detector in 'Lib\2D Barcodes\Detector\ZXing.Datamatrix.Internal.Detector.pas',
  ZXing.QrCode.Internal.AlignmentPattern in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPattern.pas',
  ZXing.QrCode.Internal.AlignmentPatternFinder in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternFinder.pas',
  ZXing.QrCode.Internal.AlignmentPatternImplementation in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternImplementation.pas',
  ZXing.QrCode.Internal.Detector in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.Detector.pas',
  ZXing.QrCode.Internal.FinderPattern in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPattern.pas',
  ZXing.QrCode.Internal.FinderPatternFinder in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternFinder.pas',
  ZXing.QrCode.Internal.FinderPatternImplementation in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternImplementation.pas',
  ZXing.QrCode.Internal.FinderPatternInfo in 'Lib\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternInfo.pas',
  ZXing.Datamatrix.DataMatrixReader in 'Lib\2D Barcodes\ZXing.Datamatrix.DataMatrixReader.pas',
  ZXing.QrCode.QRCodeReader in 'Lib\2D Barcodes\ZXing.QrCode.QRCodeReader.pas',
  ZXing.Common.Detector.MathUtils in 'Lib\Common\Detector\ZXing.Common.Detector.MathUtils.pas',
  ZXing.Common.Detector.WhiteRectangleDetector in 'Lib\Common\Detector\ZXing.Common.Detector.WhiteRectangleDetector.pas',
  ZXing.Common.ReedSolomon.GenericGF in 'Lib\Common\ReedSolomon\ZXing.Common.ReedSolomon.GenericGF.pas',
  ZXing.Common.ReedSolomon.ReedSolomonDecoder in 'Lib\Common\ReedSolomon\ZXing.Common.ReedSolomon.ReedSolomonDecoder.pas',
  ZXing.BarcodeFormat in 'Lib\Common\ZXing.BarcodeFormat.pas',
  ZXing.BitSource in 'Lib\Common\ZXing.BitSource.pas',
  ZXIng.ByteSegments in 'Lib\Common\ZXIng.ByteSegments.pas',
  ZXing.CharacterSetECI in 'Lib\Common\ZXing.CharacterSetECI.pas',
  ZXing.Common.BitArray in 'Lib\Common\ZXing.Common.BitArray.pas',
  ZXing.Common.BitArrayImplementation in 'Lib\Common\ZXing.Common.BitArrayImplementation.pas',
  ZXing.Common.BitMatrix in 'Lib\Common\ZXing.Common.BitMatrix.pas',
  ZXing.Common.DetectorResult in 'Lib\Common\ZXing.Common.DetectorResult.pas',
  ZXing.Common.GridSampler in 'Lib\Common\ZXing.Common.GridSampler.pas',
  ZXing.Common.PerspectiveTransform in 'Lib\Common\ZXing.Common.PerspectiveTransform.pas',
  ZXing.DecodeHintType in 'Lib\Common\ZXing.DecodeHintType.pas',
  ZXing.DecoderResult in 'Lib\Common\ZXing.DecoderResult.pas',
  ZXing.DefaultGridSampler in 'Lib\Common\ZXing.DefaultGridSampler.pas',
  ZXing.EncodeHintType in 'Lib\Common\ZXing.EncodeHintType.pas',
  ZXing.Helpers in 'Lib\Common\ZXing.Helpers.pas',
  ZXing.MultiFormatReader in 'Lib\Common\ZXing.MultiFormatReader.pas',
  ZXing.Reader in 'Lib\Common\ZXing.Reader.pas',
  ZXing.ReadResult in 'Lib\Common\ZXing.ReadResult.pas',
  ZXing.ResultMetadataType in 'Lib\Common\ZXing.ResultMetadataType.pas',
  ZXing.ResultPoint in 'Lib\Common\ZXing.ResultPoint.pas',
  ZXing.ResultPointImplementation in 'Lib\Common\ZXing.ResultPointImplementation.pas',
  ZXing.StringUtils in 'Lib\Common\ZXing.StringUtils.pas',
  ZXing.BaseLuminanceSource in 'Lib\Filtering\ZXing.BaseLuminanceSource.pas',
  ZXing.Binarizer in 'Lib\Filtering\ZXing.Binarizer.pas',
  ZXing.BinaryBitmap in 'Lib\Filtering\ZXing.BinaryBitmap.pas',
  ZXing.GlobalHistogramBinarizer in 'Lib\Filtering\ZXing.GlobalHistogramBinarizer.pas',
  ZXing.HybridBinarizer in 'Lib\Filtering\ZXing.HybridBinarizer.pas',
  ZXing.InvertedLuminanceSource in 'Lib\Filtering\ZXing.InvertedLuminanceSource.pas',
  ZXing.LuminanceSource in 'Lib\Filtering\ZXing.LuminanceSource.pas',
  ZXing.PlanarYUVLuminanceSource in 'Lib\Filtering\ZXing.PlanarYUVLuminanceSource.pas',
  ZXing.RGBLuminanceSource in 'Lib\Filtering\ZXing.RGBLuminanceSource.pas',
  Androidapi.JNI.Nfc in 'Imports NFC\Androidapi.JNI.Nfc.pas',
  Androidapi.JNI.Nfc.Tech in 'Imports NFC\Androidapi.JNI.Nfc.Tech.pas',
  NFCHelper in 'Imports NFC\NFCHelper.pas',
  GEDIPrinter in 'GEDIPrinter.pas',
  G700Interface in 'G700Interface.pas',
  uNFCId in 'uNFCId.pas' {frmNFCid},
  G700NFC in 'Imports NFC700\G700NFC.pas',
  JavaInterfaces in 'Imports NFC700\JavaInterfaces.pas',
  ImpressaoG in 'ImpressaoG.pas' {frmImpressaoG},
  CodigoDeBarras in 'CodigoDeBarras.pas' {frmCodBarra},
  CodigoDeBarraV2 in 'CodigoDeBarraV2.pas' {frmCodigoBarraV2},
  GER7TEF in 'GER7TEF.pas',
  TEF in 'TEF.pas' {frmTEF},
  Vcl.Consts in 'Vcl.Consts.pas',
  FMX.Consts in 'FMX.Consts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmNFCid, frmNFCid);
  Application.CreateForm(TfrmImpressaoG, frmImpressaoG);
  Application.CreateForm(TfrmCodBarra, frmCodBarra);
  Application.CreateForm(TfrmCodigoBarraV2, frmCodigoBarraV2);
  //Application.CreateForm(TfrmNFCbc, frmNFCbc);
  Application.CreateForm(TfrmTEF, frmTEF);
  //Application.CreateForm(TfrmNFC, frmNFC);
  Application.Run;
end.
