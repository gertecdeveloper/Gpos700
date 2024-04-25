import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpos700/activities/CodigoDeBarraV1.dart';
import 'package:gpos700/activities/imprimir.dart';
import 'package:gpos700/activities/tefs.dart';
import 'package:gpos700/lerCartaoGEDI.dart';
import 'package:gpos700/lerCartaoID.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('samples.flutter.dev/gedi');
  Future<void> _leitorCodigoDeBarrasV2() async {
    try {
      await platform.invokeMethod('leitorCodigoV2');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  var newTaskCtrl = TextEditingController();
  var listaNomeFuncoes = [
    {"name": "Código de Barras", "img": "assets/barcode.png"},
    {"name": "Código de Barras V2", "img": "assets/qr_code.png"},
    {"name": "Impressão", "img": "assets/print.png"},
    {"name": "NFC GEDI", "img": "assets/nfc.png"},
    {"name": "NFC Id", "img": "assets/nfc1.png"},
    {"name": "TEF", "img": "assets/pos-terminal.png"},
    
  ];

   void trocarTela(int id) {
    switch (id) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageCodigoDeBarraV1()),
        );
        break;
      case 1:
        _leitorCodigoDeBarrasV2();
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageImprimir()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageLeituraCartaoGEDI()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageLeituraCartaoID()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageTef()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: <Widget>[
                Image.asset('assets/gertec.png'),
                Text(
                  "Flutter Project v1.0.0",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listaNomeFuncoes.length,
              itemExtent: 80,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12)),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: Image(
                      image: AssetImage(listaNomeFuncoes[index]["img"]!),
                    ),
                    onTap: () {
                      trocarTela(index);
                    },
                    title: Center(
                      child: Text(
                        listaNomeFuncoes[index]["name"]!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
