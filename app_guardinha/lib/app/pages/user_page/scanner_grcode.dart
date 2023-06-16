import 'package:app_guardinha/app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class LerQrCode extends StatefulWidget {
  const LerQrCode({super.key});

  @override
  State<LerQrCode> createState() => _LerQrCodeState();
}

class _LerQrCodeState extends State<LerQrCode> {

  String? qrInfo = 'Scan a QR/Bar code';
  bool camState = false;

  /* Função que receberá uma lógica de processamento da informção lida no QrCode */
  qrCallback(String? code) {
    setState(() {
      camState = false;
      qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp().verdeContainerPadrao,
        title: const Text(
          "Leitura de QRCode."
        ),
      ),
      body: camState 
      ? Center(
        child: SizedBox(
        height: 1000,
        width: 500,
          child: QRBarScannerCamera(
            onError: (context, error) => Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            qrCodeCallback: (code) {
              qrCallback(code);
            },
          ),
        ),
      )
      :Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Enviando informações!",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: /* CircularProgressIndicator(
                color: ColorsApp().verdeContainerPadrao,
              ) */Icon(
                Icons.check_circle, 
                color: ColorsApp().verdeContainerPadrao,
                size: 70,
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp().verdeContainerPadrao,
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: const Icon(
          Icons.camera, 
        ),
      ),
    );
  }
}