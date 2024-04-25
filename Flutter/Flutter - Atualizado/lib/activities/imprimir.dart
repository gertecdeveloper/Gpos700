import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageImprimir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Imprimir(title: 'Impressão'),
    );
  }
}

class Imprimir extends StatefulWidget {
  Imprimir({Key? key, required this.title}) : super(key: key);
  final String title;
  _Imprimir createState() => _Imprimir();
}

class _Imprimir extends State<Imprimir> {
  static const platform = const MethodChannel('samples.flutter.dev/gedi');
  final myController = TextEditingController();
  int dropdownValueSize = 20;
  int dropdownBarHeight = 280;
  int dropdownBarWidth = 280;
  String dropdownFont = "DEFAULT";
  String dropdownBarType = "QR_CODE";
  String alinhar = "CENTER";
  String valorSelecionado = "CENTER";
  List<bool> listSelecionado = [false, false, false];
  void radioButtonChanges(String? value) {
    setState(() {
      valorSelecionado = value!;
      switch (value) {
        case 'LEFT':
          alinhar = value;
          break;
        case 'CENTER':
          alinhar = value;
          break;
        case 'RIGHT':
          alinhar = value;
          break;
        default:
          alinhar = "";
      }
      print(alinhar); //Debug the choice in console
    });
  }

  void erroImpresao() {
    showDialog(
      context: context,
      builder: (BuildContext c) {
        return AlertDialog(
          title: Text("Escreva uma mensagem para ser impressa !"),
        );
      },
    );
  }

  // Função responsavel por finalizar impressao - ImpressoraOutput();
  void finalizarImpressao() async {
    await platform.invokeMethod('fimimpressao');
  }

  void impressaoDeTexto(
      {required String texto,
      required int fontSize,
      required String alinhar,
      required String fontFamily,
      required List<bool> selectedOptions}) async {
    texto = texto ?? ""; // Caso seja null
    if (texto.isEmpty) {
      erroImpresao();
    } else {
      try {
        await platform.invokeMethod(
          'imprimir',
          <String, dynamic>{
            "tipoImpressao": "Texto",
            "mensagem": texto,
            "alinhar": alinhar ?? "CENTER",
            "size": fontSize ?? 10,
            "font": fontFamily ?? "DEFAULT",
            "options": selectedOptions ?? [false, false, false]
          },
        );
      } on PlatformException catch (e) {
        print(e.message);
      }
    }
  }

  Future<void> _impressaoTodasFuncoes() async {
    try {
      await platform.invokeMethod('imprimir', <String, dynamic>{
        "tipoImpressao": "TodasFuncoes",
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future<void> _impressaoDeImagem() async {
    try {
      await platform.invokeMethod('imprimir', <String, dynamic>{
        "tipoImpressao": "Imagem",
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future<void> _impressaoDeCodigoDeBarra(
      {required String texto,
      required int height,
      required int width,
      required String barCode}) async {
    texto = texto ?? ""; // Caso seja null
    if (texto.isNotEmpty) {
      try {
        await platform.invokeMethod('imprimir', <String, dynamic>{
          "tipoImpressao": "CodigoDeBarra",
          "height": height ?? 200,
          "width": width ?? 200,
          "barCode": barCode ?? "QR_CODE",
          "mensagem": texto
        });
      } on PlatformException catch (e) {
        print(e.message);
      }
    } else {
      erroImpresao();
    }
  }

  Future<String> checarImpressora() async {
    try {
      bool impressora = await platform.invokeMethod('checarImpressora');
      if (impressora == true)
        return "Ok";
      else
        return "Erro";
    } on PlatformException catch (e) {
      print(e.message);
    }
    return "Erro";
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(400.0, 810.0),
    );

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 40.w,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Funções Impressão G700/G800",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 300.w,
                child: ElevatedButton(
                  child: Text("STATUS IMPRESSORA"),
                  onPressed: () {
                    checarImpressora().then((value) {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext c) {
                            return AlertDialog(
                              title: Text("Status Impressora"),
                              content: Text("Impressora: " + value.toString()),
                            );
                          },
                        );
                      });
                    });
                  },
                ),
              ),
              TextFormField(
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Escreva a sua mensagem',
                ),
                controller: myController,
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Configuração de Impressão",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                      value: 'LEFT',
                      groupValue: valorSelecionado,
                      onChanged: radioButtonChanges),
                  AutoSizeText(
                    'Esquerda',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Radio(
                      value: 'CENTER',
                      groupValue: valorSelecionado,
                      onChanged: radioButtonChanges),
                  AutoSizeText(
                    'Centralizado',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Radio(
                      value: 'RIGHT',
                      groupValue: valorSelecionado,
                      onChanged: radioButtonChanges),
                  AutoSizeText(
                    'Direita',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 110.w,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listSelecionado[0] = !listSelecionado[0];
                        });
                      },
                      child: Text(
                        "NEGRITO",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listSelecionado[1] = !listSelecionado[1];
                        });
                      },
                      child: Text(
                        "ITÁLICO",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          listSelecionado[2] = !listSelecionado[2];
                        });
                      },
                      child: Text(
                        "SUBLINHADO",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Font: ",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  DropdownButton<String>(
                    value: dropdownFont,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownFont = newValue!;
                      });
                    },
                    items: <String>[
                      'DEFAULT',
                      'MONOSPACE',
                      'SANS SERIF',
                      'SERIF',
                      'VECTRA.otf',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                  Text(
                    "Size: ",
                    style: TextStyle(color: Colors.black, fontSize: 20.sp),
                  ),
                  DropdownButton<int>(
                    value: dropdownValueSize,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValueSize = newValue!;
                      });
                    },
                    items: <int>[20, 30, 40, 50, 70, 80, 90, 100]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      child: Text(
                        'IMPRIMIR TEXTO',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      onPressed: () {
                        // Não precisa passar todos os parâmetros - Sera dado o valor DEFAULT
                        impressaoDeTexto(
                          texto: myController.text,
                          fontSize: dropdownValueSize,
                          alinhar: alinhar,
                          fontFamily: dropdownFont,
                          selectedOptions: listSelecionado,
                        );
                        finalizarImpressao(); // Limpa buffer de impressão
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      child: Text(
                        'IMPRIMIR IMAGEM',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      onPressed: () {
                        _impressaoDeImagem();
                        finalizarImpressao(); // Limpa buffer de impressão
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Bar Code Height"),
                      DropdownButton<int>(
                        value: dropdownBarHeight,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownBarHeight = newValue!;
                          });
                        },
                        items: <int>[10, 40, 80, 120, 160, 200, 280, 320]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Bar Code Width"),
                      DropdownButton<int>(
                        value: dropdownBarWidth,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownBarWidth = newValue!;
                          });
                        },
                        items: <int>[10, 40, 80, 120, 160, 200, 280, 320]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Bar Codes"),
                      DropdownButton<String>(
                        value: dropdownBarType,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownBarType = newValue!;
                          });
                        },
                        items: <String>[
                          'QR_CODE',
                          'CODE_128',
                          'EAN_8',
                          'EAN_13',
                          'PDF_417',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  child: Text(
                    'IMPRIMIR BARCODE',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    // Não precisa passar todos os parâmetros - Sera dado o valor DEFAULT
                    _impressaoDeCodigoDeBarra(
                      texto: myController.value.text.toString(),
                      height: dropdownBarHeight,
                      width: dropdownBarWidth,
                      barCode: dropdownBarType,
                    );
                    finalizarImpressao(); // Limpa buffer de impressão
                  },
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  child: Text(
                    'IMPRIMIR TODAS FUNÇÕES',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    _impressaoTodasFuncoes();
                    finalizarImpressao(); // Limpa buffer de impressão
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
