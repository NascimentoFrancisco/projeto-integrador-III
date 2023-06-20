// ignore_for_file: use_build_context_synchronously

import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/pages/logs/logs.dart';
import 'package:app_guardinha/app/pages/user_page/my_datas.dart';
import 'package:app_guardinha/app/pages/user_page/change_password.dart';
import 'package:app_guardinha/app/pages/user_page/scanner_grcode.dart';
import 'package:app_guardinha/app/widgets/logo.dart';
import 'package:app_guardinha/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BodyUserPage extends StatefulWidget {
  const BodyUserPage({super.key});

  @override
  State<BodyUserPage> createState() => _BodyUserPageState();
}

class _BodyUserPageState extends State<BodyUserPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.height*1,
          decoration: BoxDecoration(
            color: ColorsApp().verdeContainerPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: retornaLogoRedondo(context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 50, top: 8.0),
                child: Observer(
                  builder: (context){
                    return Text(formataNome(guardaStores.guarda!.nome),
                      style: TextStyle(
                        color: ColorsApp().textoBrancoPadrao,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  },
                ),
              ),
              fazBotoesBody("Meus dados", const MeusDados()),
              fazBotoesBody("Ler QrCode", const LerQrCode()),
              fazBotoesBody("Mudar senha", const MudarSenha()),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 25, bottom: 35),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return WillPopScope(
                            onWillPop: () async => false, 
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                content: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                    onTap: () {}, 
                                    child: AlertDialog(
                                      title: const Text('Logout'),
                                      content: const Text('Você realmente deseja sair do sistema?'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorsApp().vermelhoVoltarErros,
                                          ),
                                          child: const Text('Cancelar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        Observer(
                                          builder: (context){
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: ColorsApp().azulBotaoSucessoPadrao,
                                              ),
                                              onPressed: guardaStores.getClicado ? (){}: () async{
                                                guardaStores.setClicado(true);
                                                bool logout = await guardaStores.apagaTokens();
                                                if(logout){
                                                  Navigator.of(context).pop();
                                                  Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) => const Logs())
                                                  );
                                                }
                                                guardaStores.setClicado(false);
                                              },
                                              child: guardaStores.getClicado ?  
                                              const CircularProgressIndicator(
                                                color: Colors.white,
                                              ):
                                              const Text('Confirmar'),
                                            );
                                          }
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                      }, 
                      child: Text("Sair",
                        style: TextStyle(
                          color: ColorsApp().textoBrancoPadrao,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double
                        ),
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget fazBotoesBody(String menuTipo, Widget menuDesejado){
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
        child: Observer(
          builder: (context){
            return Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => menuDesejado)
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp().azulBotaoSucessoPadrao,
                  minimumSize: const Size(300, 50)
                ), 
                child: Text(menuTipo,
                  style: TextStyle(
                    color: ColorsApp().textoBrancoPadrao,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            );
          }
      ),
    );
  }

  String formataNome(String? nome){
    if (nome == null){
      return "Aguarde...";
    }
    String nomeFormatado= "";
    List<String> nomelist = nome.split(" ");
    if (nomelist[1] == "da" || nomelist[1] == "de" || nomelist[1] == "do"){
      for(int index = 0; index < 3; index ++){
        if(index == 0){
          nomeFormatado += nomelist[index];
        } else{
          nomeFormatado += " ${nomelist[index]}";
        }
      }
    }else{
      for(int index = 0; index < 2; index ++){
        if(index == 0){
          nomeFormatado += nomelist[index];
        } else{
          nomeFormatado += " ${nomelist[index]}";
        }
      }
    }
    return "Olá, $nomeFormatado";
  }

}