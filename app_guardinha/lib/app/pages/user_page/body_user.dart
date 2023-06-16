import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/pages/home/home.dart';
import 'package:app_guardinha/app/pages/user_page/my_datas.dart';
import 'package:app_guardinha/app/pages/user_page/reset_password.dart';
import 'package:app_guardinha/app/pages/user_page/scanner_grcode.dart';
import 'package:app_guardinha/app/widgets/logo.dart';
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
                    return Text("Olá guardinha!",
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
                      onPressed: ()async{
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const Inicio())
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

}