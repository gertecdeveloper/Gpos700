{
  * Copyright 2008 ZXing authors
  *
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *      http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.

  * Implemented by E. Spelt for Delphi
}

unit ZXing.BarcodeFormat;

interface

type
  TBarcodeFormat = (
    /// <summary>No format set. All formats will be used</summary>
    Auto = 0,

    /// <summary>Aztec 2D barcode format.</summary>
    AZTEC = 1,

    /// <summary>CODABAR 1D format.</summary>
    CODABAR = 2,

    /// <summary>Code 39 1D format.</summary>
    CODE_39 = 4,

    /// <summary>Code 93 1D format.</summary>
    CODE_93 = 8,

    /// <summary>Code 128 1D format.</summary>
    CODE_128 = 16,

    /// <summary>Data Matrix 2D barcode format.</summary>
    DATA_MATRIX = 32,

    /// <summary>EAN-8 1D format.</summary>
    EAN_8 = 64,

    /// <summary>EAN-13 1D format.</summary>
    EAN_13 = 128,

    /// <summary>ITF (Interleaved Two of Five) 1D format.</summary>
    ITF = 256,

    /// <summary>MaxiCode 2D barcode format.</summary>
    MAXICODE = 512,

    /// <summary>PDF417 format.</summary>
    PDF_417 = 1024,

    /// <summary>QR Code 2D barcode format.</summary>
    QR_CODE = 2048,

    /// <summary>RSS 14</summary>
    RSS_14 = 4096,

    /// <summary>RSS EXPANDED</summary>
    RSS_EXPANDED = 8192,

    /// <summary>UPC-A 1D format.</summary>
    UPC_A = 16384,

    /// <summary>UPC-E 1D format.</summary>
    UPC_E = 32768,

    /// <summary>UPC/EAN extension format. Not a stand-alone format.</summary>
    UPC_EAN_EXTENSION = 65536,

    /// <summary>MSI</summary>
    MSI = 131072,

    /// <summary>Plessey</summary>
    PLESSEY = 262144,

    ///<summary>All_1D</summary>
    ALL_1D = UPC_A or UPC_E or EAN_13 or EAN_8 or CODABAR or CODE_39 or CODE_93 or CODE_128 or ITF or RSS_14 or RSS_EXPANDED

    );

implementation

end.