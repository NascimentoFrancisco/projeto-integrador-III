
import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class LerQrCode extends StatefulWidget {
  const LerQrCode({super.key});

  @override
  State<LerQrCode> createState() => _LerQrCodeState();
}

class _LerQrCodeState extends State<LerQrCode> {

  String? qrInfo = 'Scan a QR/Bar code';
  bool camState = false;
  bool cliked = false;

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
      guardaStores.limpaMensagem();
      guardaStores.setdadosEnviados(false);
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
        child: Observer(builder: (context){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(guardaStores.mensagem.isNotEmpty? 
                  guardaStores.mensagem :
                  "Enviando informações!",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    guardaStores.getdadosEnviados ?
                      Icon(
                        Icons.check_circle, 
                        color: ColorsApp().verdeContainerPadrao,
                        size: 70,
                      )
                      :
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp().azulBotaoSucessoPadrao,
                        ),
                        onPressed: guardaStores.getClicado ? (){}:()async{
                          guardaStores.setClicado(true);
                           await guardaStores.enviaDadosQrCode(qrInfo!);
                          guardaStores.setClicado(false);
                        }, 
                        child: guardaStores.getClicado ? 
                        const CircularProgressIndicator(color: Colors.green,)
                        :
                        const Text("Enviar dados")
                      )
                  ],
                )
              )
            ],
          );
        }),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp().verdeContainerPadrao,
        onPressed: () {
          if (camState == true) {
            setState(() {
              guardaStores.limpaMensagem();
              guardaStores.setdadosEnviados(false);
              camState = false;
            });
          } else {
            setState(() {
              guardaStores.limpaMensagem();
              guardaStores.setdadosEnviados(false);
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