// ignore_for_file: use_build_context_synchronously

import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/pages/authentication/reset_password.dart';
import 'package:app_guardinha/app/pages/logs/logs.dart';
import 'package:app_guardinha/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool obscured = true;
  final textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().textoBrancoPadrao,
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
                      color: ColorsApp().verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text('Área de login',
                                style: TextStyle(
                                  color: ColorsApp().textoBrancoPadrao,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),                          
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TextField(
                              controller: cpfController,
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsApp().textoBrancoPadrao,
                                labelText: "CPF",
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
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 35),
                            child: TextField(
                              controller: senhaController,
                              obscureText: obscured,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsApp().textoBrancoPadrao,
                                labelText: "Senha",
                                labelStyle: const TextStyle(
                                  color:Colors.black
                                ), 
                                prefixIcon: const Icon(Icons.lock_rounded,color: Color.fromARGB(255, 6, 168, 90),size: 24), 
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: GestureDetector(
                                    onTap: toggleObscured,
                                    child: Icon(
                                      obscured
                                      ? Icons.visibility_rounded
                                      :Icons.visibility_off_rounded,
                                      size: 24,
                                      color: const Color.fromARGB(255, 6, 168, 90),
                                    ),
                                  ),
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
                          ),
                          Center(
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) => const ResetPassword()))
                                );
                              }, 
                              child: Text("Esqueci a senha.",
                                style: TextStyle(
                                  color: ColorsApp().textoBrancoPadrao,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.double
                                ),
                              )
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Observer(
                                  builder: (context){
                                    return ElevatedButton(
                                      onPressed: guardaStores.getClicado ? (){} : ()async{
                                        FocusScope.of(context).requestFocus(FocusNode());
                                                  
                                        guardaStores.setClicado(true);
                                        bool log = await guardaStores.efetuaLogin(cpfController.text, senhaController.text);
                                        
                                        if (log){
                                          guardaStores.setClicado(false);
                                          Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: ((context) => const Logs()))
                                          );
                                        }else{
                                          guardaStores.setClicado(false);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(guardaStores.mensagem,
                                                style: const TextStyle(color: Colors.white)
                                              ),
                                              backgroundColor: Colors.redAccent,
                                              action: SnackBarAction(
                                                label: 'Fechar',
                                                textColor: Colors.black,
                                                onPressed: (){},
                                              ),
                                            )
                                          );
                                        }
                                        
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(255, 4, 57, 170),
                                        minimumSize: const Size(140, 40)
                                      ), 
                                      child: guardaStores.getClicado ? 
                                        const CircularProgressIndicator(
                                          color: Colors.white,
                                        ) 
                                        : 
                                        const Text("Entrar",
                                        style: TextStyle(
                                          fontSize: 25
                                        ),
                                      )
                                    );
                                  }
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleObscured() {
    setState(() {
      obscured = !obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }
}