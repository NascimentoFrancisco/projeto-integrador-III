
import 'package:app_guardinha/app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


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
                    child: const Image(image: AssetImage('assets/images/logo.png')),
                  ),
                ),
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
                          padding: const EdgeInsets.only(top: 30),
                          child: Text("Redefinição de senha",
                            style: TextStyle(
                              color: ColorsApp().textoBrancoPadrao,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12, top: 20, bottom: 20),
                          child: Text("Insira um e-mail válido para a solicitação de redefinição de senha",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsApp().textoBrancoPadrao,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsApp().textoBrancoPadrao,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorsApp().vermelhoVoltarErros
                                      ),
                                      child: const Text("Voltar",
                                        style: TextStyle(
                                          fontSize: 25
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Observer(
                                  builder: (context){
                                    return ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorsApp().azulBotaoSucessoPadrao
                                      ), 
                                      child: /* alunoLoginStores.getClickLogin ? 
                                        const CircularProgressIndicator(
                                          color: Colors.white,
                                        ): */
                                        const Text("Enviar",
                                          style: TextStyle(
                                          fontSize: 25
                                        ),
                                      )
                                    );
                                  }
                                ),
                              )
                            ],
                          ),
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