
import 'package:access_control/pages/reset_password/reset_password.dart';
import 'package:access_control/pages/user_page/home_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../colors/cores_padroes.dart';
import '../../stores/aluno.stores.dart';

AlunoStores alunoStores = AlunoStores();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController matriculaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textoBrancoPadrao,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 160,
                    child: const Image(image: AssetImage('assets/images/logo-remove.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text('Área de login',
                              style: TextStyle(
                                color: textoBrancoPadrao,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: matriculaController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textoBrancoPadrao,
                              labelText: "Matrícula",
                              labelStyle: const TextStyle(
                                color:Colors.black
                              ), 
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 7, 0)
                                ),
                              ),
                              enabledBorder:const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1
                                ),
                              ), 
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: senhaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textoBrancoPadrao,
                              labelText: "Senha",
                              labelStyle: const TextStyle(
                                color:Colors.black
                              ), 
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 7, 0)
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1
                                ),
                              ), 
                            ),
                          ),

                          const SizedBox(
                            height: 35,
                          ),
                          Center(
                            child: TextButton(onPressed: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: ((context) => const ResetPassword()))
                              );
                            }, 
                              child: Text("Esqueci a senha.",
                                style: TextStyle(
                                  color: textoBrancoPadrao,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.double
                                ),
                              )
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {

                                  bool log = await loginStores.efetuaLogin(matriculaController.text, senhaController.text);

                                  if (log){
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) => const HomeUser()))
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 4, 57, 170),
                                  minimumSize: const Size(140, 40)
                                ), 
                                child: const Text("Entrar",
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                )
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  var snackBar = SnackBar(
    content: Observer(builder: (_) => Text(loginStores.messege,
      style: const TextStyle(color: Colors.white),
    ),),
    backgroundColor: Colors.redAccent,
    action: SnackBarAction(
      label: 'Fechar',
      textColor: Colors.black,
      onPressed: (){},
      ),
  );

}