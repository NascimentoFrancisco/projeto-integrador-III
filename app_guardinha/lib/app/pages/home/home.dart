import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/pages/authentication/login.dart';
import 'package:app_guardinha/app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().textoBrancoPadrao,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                retornaLogo(),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp().verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Área inicial",
                                style: TextStyle(
                                  color: ColorsApp().textoBrancoPadrao,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 80.0, top: 20),
                          child: Observer(
                            builder: (context){
                              return ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const LoginPage())
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp().azulBotaoSucessoPadrao,
                                  minimumSize: const Size(300, 50)
                                ), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: /* appStores.getClicked ? 
                                        const CircularProgressIndicator()
                                      : */Text("Fazer Login",
                                        style: TextStyle(
                                          color: ColorsApp().textoBrancoPadrao,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              );
                            },
                          )
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}