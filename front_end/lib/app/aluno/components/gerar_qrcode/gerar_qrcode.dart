
import 'package:access_control/app/logs/logs.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class GerarQrCodes extends StatefulWidget {
  const GerarQrCodes({super.key});


  @override
  State<GerarQrCodes> createState() => _GerarQrCodesState();
}

class _GerarQrCodesState extends State<GerarQrCodes> {

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
                    return Column(
                      children: [
                        if (alunoLoginStores.getDadosQrCodeValido)
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Text(
                              "Contagem: ${alunoLoginStores.getcontSegundosQrcode} segundos restantes.",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "Registro de ${alunoLoginStores.getDadosQrCode["Tipo"]} na instituição.",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0, bottom: 80.0),
                          child: alunoLoginStores.getDadosQrCodeValido ? 
                          BarcodeWidget(/* String usada para gerar QRCode altrada */
                            data: '{"Tipo":"${alunoLoginStores.getDadosQrCode["Tipo"]}","Token":"${alunoLoginStores.getDadosQrCode["Token"]}"}', 
                            barcode: Barcode.qrCode(
                              errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                            ),
                            width: 300,
                            height: 300,
                          ):
                          Column(
                            children: [
                              const ListTile(
                                title: Text(
                                  "QrCode expirado :(",
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Clique no botão abaixo para atualizar seu Qrcode.",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: IconButton(
                                  onPressed: () async{
                                    await alunoLoginStores.atualizaTokenAccess();
                                    alunoLoginStores.setDadosQrCode();
                                    alunoLoginStores.countSeconds();
                                  }, 
                                  icon: const Icon(Icons.refresh_rounded),
                                  iconSize: 60,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            alunoLoginStores.setDadosQrCodeValido(false);
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                          ),
                          child: const Text("Voltar",
                            style: TextStyle(
                              fontSize: 28
                            ),
                          )
                        )
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