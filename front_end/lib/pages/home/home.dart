
import 'package:access_control/pages/login/login.dart';
import 'package:access_control/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../../colors/cores_padroes.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushReplacement(context,
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
                                Text("Entrar como aluno",
                                  style: TextStyle(
                                    color: textoBrancoPadrao,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )
                          )
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: azulBotaoSucessoPadrao,
                              minimumSize: const Size(300, 50)
                            ), 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Entrar como responsável",
                                  style: TextStyle(
                                    color: textoBrancoPadrao,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )
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