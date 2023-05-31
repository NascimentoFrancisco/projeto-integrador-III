
import 'package:access_control/stores/app.stores.dart';
import 'package:access_control/stores/responsavel.stores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import '../login/login.dart';
import '../widgets/colors/colors.dart';
import '../widgets/logos/logos.dart';

ResponsavelStores responsavelStores = ResponsavelStores();
AppStores appStores = AppStores();

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textoBrancoPadrao,
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
                      color: verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Área inicial",
                                style: TextStyle(
                                  color: textoBrancoPadrao,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Observer(
                            builder: (context){
                              return ElevatedButton(
                                onPressed: appStores.getClicked ? null : () async {
                                  appStores.setClicked();
                                  await appStores.setAluno();
                                  appStores.setClicked();

                                  // ignore: use_build_context_synchronously
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const LoginPage())
                                  );  
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: azulBotaoSucessoPadrao,
                                  minimumSize: const Size(300, 50)
                                ), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: appStores.getClicked ? 
                                        const CircularProgressIndicator()
                                      :Text("Entrar como aluno",
                                        style: TextStyle(
                                          color: textoBrancoPadrao,
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Observer(
                            builder: (context){
                              return ElevatedButton(
                                onPressed: appStores.getClicked ? null : () async {
                                  appStores.setClicked();
                                  await appStores.setResponsavel();
                                  appStores.setClicked();
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const LoginPage())
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: azulBotaoSucessoPadrao,
                                  minimumSize: const Size(300, 50)
                                ), 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: appStores.getClicked ? 
                                        const CircularProgressIndicator()
                                      :Text("Entrar como responsável",
                                        style: TextStyle(
                                          color: textoBrancoPadrao,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              );
                            }
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        )                        
                      ],
                    ) 
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}