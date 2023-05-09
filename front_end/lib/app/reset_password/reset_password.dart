
import 'package:access_control/app/logs/logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../widgets/botoes/botoes.dart';
import '../widgets/colors/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  TextEditingController emailController = TextEditingController();

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
                    child: const Image(image: AssetImage('assets/images/logo.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text("Redefinição de senha",
                          style: TextStyle(
                            color: textoBrancoPadrao,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("Insira um e-mail válido para a solicitação de redefinição de senha",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textoBrancoPadrao,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textoBrancoPadrao,
                              labelText: "E-mail",
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            retornaBotaoVoltarParao(context),
                            const SizedBox(
                              width: 30,
                            ),
                            Observer(
                              builder: (context){
                                return ElevatedButton(
                                  onPressed: alunoLoginStores.getClickLogin? (){}: ()async{
                                    alunoLoginStores.setClickLogin(true);
                                    bool emailEnviado = await alunoLoginStores.enviaEmailRedefenirSenha(emailController.text);
                                    if(emailEnviado){
                                      emailController.clear();
                                      alunoLoginStores.setClickLogin(false);
                                    }

                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(alunoLoginStores.mensagem,
                                          style: TextStyle(
                                            color: emailEnviado ? Colors.black : Colors.white
                                          ),
                                        ),
                                        backgroundColor: emailEnviado ? Colors.greenAccent : Colors.redAccent,
                                        action: SnackBarAction(
                                          label: 'Fechar',
                                          textColor: Colors.black,
                                          onPressed: (){},
                                        ),
                                      )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: azulBotaoSucessoPadrao
                                  ), 
                                  child: alunoLoginStores.getClickLogin ? 
                                    const CircularProgressIndicator(
                                      color: Colors.white,
                                    ):
                                    const Text("Enviar",
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
              ],
            )
          ),
        ),
      ),
    );
  }
}