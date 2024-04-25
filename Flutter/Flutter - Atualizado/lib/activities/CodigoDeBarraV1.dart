// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageCodigoDeBarraV1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CodigoDeBarrav1(title: 'Ler Código de Barras'),
    );
  }
}

class CodigoDeBarrav1 extends StatefulWidget {
  CodigoDeBarrav1({Key? key, required this.title}) : super(key: key);
  final String title;
  _CodigoDeBarrav1 createState() => _CodigoDeBarrav1();
}

class _CodigoDeBarrav1 extends State<CodigoDeBarrav1> {
  static const platform = const MethodChannel('samples.flutter.dev/gedi');
  final myController = TextEditingController();
  List<String> resultadosBardCod = List<String>.empty(growable: true);

  Future<void> _leitorCodigoDeBarra(String tipoLeitura) async {
    print("_leitorCodigoDeBarra");
    try {
      String teste = await platform.invokeMethod(
          'leitorCodigov1', <String, dynamic>{"tipoLeitura": tipoLeitura});
      setState(() {
        resultadosBardCod.add(teste);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(400.0, 810.0),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 40.w,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Ler Código de Barras",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    child: Text(
                      'EAN 8',
                      style: TextStyle(fontSize: 15.sp, color: Colors.red),
                    ),
                    onPressed: () {
                      _leitorCodigoDeBarra("EAN_8");
                    },
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    child: Text(
                      'EAN 13',
                      style: TextStyle(fontSize: 15.sp, color: Colors.red),
                    ),
                    onPressed: () {
                      _leitorCodigoDeBarra("EAN_13");
                    },
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    child: Text(
                      'EAN 14',
                      style: TextStyle(fontSize: 15.sp, color: Colors.red),
                    ),
                    onPressed: () {
                      _leitorCodigoDeBarra("EAN_14");
                    },
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(
                    child: Text(
                      'QR CODE',
                      style: TextStyle(fontSize: 15.sp, color: Colors.red),
                    ),
                    onPressed: () {
                      _leitorCodigoDeBarra("QR_CODE");
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: resultadosBardCod.length,
                itemExtent: 50.h,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: ListTile(
                      dense: true,
                      title: Text(
                        resultadosBardCod[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.black54),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
