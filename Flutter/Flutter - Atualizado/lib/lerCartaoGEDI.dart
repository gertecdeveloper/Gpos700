import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PageLeituraCartaoGEDI());
}

class PageLeituraCartaoGEDI extends StatelessWidget {
  const PageLeituraCartaoGEDI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LeituraCartaoGEDI(title: 'Impressão de Texto'),
    );
  }
}

class LeituraCartaoGEDI extends StatefulWidget {
  const LeituraCartaoGEDI({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LeituraCartaoGEDI createState() => _LeituraCartaoGEDI();
}

class _LeituraCartaoGEDI extends State<LeituraCartaoGEDI> {
  static const platform = MethodChannel('samples.flutter.dev/gedi');
  final myController = TextEditingController();
  List<String> resultadosNFCGEDI = <String>[];

  Future<void> _lerCartaoGEDI() async {
    try {
      final String id = await platform.invokeMethod('lernfcgedi');
      setState(() {
        resultadosNFCGEDI.add("Código do Cartão (GEDI): $id");
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ElevatedButton(
                child: const Text("Ler Cartão Nfc (GEDI)"),
                onPressed: _lerCartaoGEDI,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("ID Cartões"),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: resultadosNFCGEDI.length,
                itemExtent: 50,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    title: Text(
                      resultadosNFCGEDI[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.black54),
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
