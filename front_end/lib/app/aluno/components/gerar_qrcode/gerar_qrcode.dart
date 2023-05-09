
import 'package:access_control/app/logs/logs.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../widgets/botoes/botoes.dart';


class GerarQrCode extends StatefulWidget {
  const GerarQrCode({super.key});


  @override
  State<GerarQrCode> createState() => _GerarQrCodeState();
}

class _GerarQrCodeState extends State<GerarQrCode> {

  
  Map<String, dynamic> dados = {
    "Tipo": "Entra ou saída",
    "Token": "Aqui terá um token"
  };

  /* 
  Aqui terá um código no método initState para gerar um jason para gerar o QRCode
  */
  @override
  void initState() {
    super.initState();

    dados["Tipo"] = alunoLoginStores.tipoQrCode;
    dados["Token"] = alunoLoginStores.tokens["access"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Observer(
                  builder: (context){
                    return Padding(
                      padding: const EdgeInsets.only(top: 130.0, bottom: 130.0),
                      child: BarcodeWidget(
                        data: dados.toString(), 
                        barcode: Barcode.qrCode(
                          errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                        ),
                        width: 300,
                        height: 300,
                      ),
                    );
                  }
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