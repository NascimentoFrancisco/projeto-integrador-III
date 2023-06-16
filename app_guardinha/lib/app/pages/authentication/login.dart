import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/pages/authentication/reset_password.dart';
import 'package:app_guardinha/app/pages/user_page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController matriculaController = TextEditingController();
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
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text('Área de login',
                              style: TextStyle(
                                color: ColorsApp().textoBrancoPadrao,
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
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
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

                          const SizedBox(
                            height: 35,
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
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Observer(
                                builder: (_){
                                  return ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) => const HomeUser()))
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 4, 57, 170),
                                      minimumSize: const Size(140, 40)
                                    ), 
                                    child: /* alunoLoginStores.getClickLogin ? 
                                      const CircularProgressIndicator(
                                        color: Colors.white,
                                      ) : */ 
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