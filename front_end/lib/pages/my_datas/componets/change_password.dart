
import 'package:access_control/pages/login/login.dart';
import 'package:access_control/widgets/botao_voltar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../colors/cores_padroes.dart';
import '../../user_page/home_user.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  bool obscured = true;
  final textFieldFocusNode = FocusNode();

  TextEditingController senhaAntigaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaconfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textoBrancoPadrao,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text("Mudança de senha",
                            style: TextStyle(
                              color: textoBrancoPadrao,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            obscureText: obscured,
                            controller: senhaAntigaController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textoBrancoPadrao,
                              labelText: "Senha antiga",
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
                            height: 20,
                          ),
                          TextField(
                            obscureText: obscured,
                            controller: senhaController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textoBrancoPadrao,
                              labelText: "Nova senha",
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
                            height: 20,
                          ),
                          TextField(
                            obscureText: obscured,
                            controller: senhaconfirmController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textoBrancoPadrao,
                              labelText: "Confimação de senha",
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              retornaBotaoVoltarParao(context),
                              const SizedBox(
                                width: 40,
                              ),
                              Observer(
                                builder: (_) {
                                  return ElevatedButton(
                                    onPressed: loginStores.getClicked 
                                    ?(){}
                                    : () async{
                                     await loginStores.mudaSenha(
                                        senhaAntigaController.text, 
                                        senhaController.text, 
                                        senhaconfirmController.text, 
                                        alunoStores.aluno!,
                                        loginStores.token!  
                                      );
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: azulBotaoSucessoPadrao
                                    ), 
                                    child: loginStores.getClicked 
                                      ?const CircularProgressIndicator(
                                        color: Colors.white,
                                      )  
                                      :const Text("Salvar",
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
            )
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