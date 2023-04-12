import 'package:access_control/widgets/botao_voltar.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';


class GeneratorQRCode extends StatefulWidget {
  const GeneratorQRCode({super.key});

  @override
  State<GeneratorQRCode> createState() => _GeneratorQRCodeState();
}

class _GeneratorQRCodeState extends State<GeneratorQRCode> {

  var code = 'Testando o gerador de QRCode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130.0, bottom: 130.0),
                  child: BarcodeWidget(
                    data: code, 
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                    ),
                    width: 300,
                    height: 300,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        retornaBotaoVoltarParao(context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
}