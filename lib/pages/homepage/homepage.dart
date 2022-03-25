import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lcadp/core/app_images.dart';
import 'package:lcadp/pages/safe_page.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _ammount = 15000;
  String codeValue = '';

  _validateQrCode() async {
    var cameraRequest = await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Permissão negada')));
    } else {
      String qrCode = await FlutterBarcodeScanner.scanBarcode(
        "FFFFFF",
        "Cancelar",
        false,
        ScanMode.QR,
      );
      setState(() => codeValue != '-1' ? qrCode : 'Não validado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Saldo: $_ammount',
              style: TextStyle(color: Colors.white70, fontSize: 40),
            ),
            Container(
              margin: EdgeInsets.all(100),
              child: Image.asset(
                AppImages.safe,
                color: Colors.white70,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                            backgroundColor: Colors.black12, body: SafePage()),
                      ));
                },
                child: Text('Sem câmera'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: _validateQrCode,
          tooltip: 'Abrir Camera',
          child: const Icon(
            Icons.qr_code,
          )),
    );
  }
}
