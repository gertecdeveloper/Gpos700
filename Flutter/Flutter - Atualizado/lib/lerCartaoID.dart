import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PageLeituraCartaoID());
}

class PageLeituraCartaoID extends StatelessWidget {
  const PageLeituraCartaoID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LeituraCartaoID(title: 'Impressão de Texto'),
    );
  }
}

class LeituraCartaoID extends StatefulWidget {
  const LeituraCartaoID({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LeituraCartaoID createState() => _LeituraCartaoID();
}

class _LeituraCartaoID extends State<LeituraCartaoID> {
  static const platform = MethodChannel('samples.flutter.dev/gedi');
  final myController = TextEditingController();
  List<String> resultadosNFCID = <String>[];

  Future<void> _lerCartaoID() async {
    try {
      final String id = await platform.invokeMethod('lernfcid');
      setState(() {
        resultadosNFCID.add("Código do Cartão (ID): $id");
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
                child: const Text("Ler Cartão Nfc (Nativo)"),
                onPressed: _lerCartaoID,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("ID Cartões"),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: resultadosNFCID.length,
                itemExtent: 50,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    title: Text(
                      resultadosNFCID[index],
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
