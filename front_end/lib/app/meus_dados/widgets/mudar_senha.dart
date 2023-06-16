
import 'package:access_control/app/inicio/inicio.dart';
import 'package:access_control/app/logs/logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/botoes/botoes.dart';
import '../../widgets/colors/colors.dart';


class MudarSenha extends StatefulWidget {
  const MudarSenha({super.key});

  @override
  State<MudarSenha> createState() => _MudarSenhaState();
}

class _MudarSenhaState extends State<MudarSenha> {

  bool obscuredSenhaAntiga = true;
  bool obscuredSenhaNova = true;
  bool obscuredSenhaConfirma = true;
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
                            obscureText: obscuredSenhaAntiga,
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
                                  onTap: toggleObscuredSenhaAntiga,
                                  child: Icon(
                                    obscuredSenhaAntiga
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
                            obscureText: obscuredSenhaNova,
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
                                  onTap: toggleObscuredSenhaNova,
                                  child: Icon(
                                    obscuredSenhaNova
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
                            obscureText: obscuredSenhaConfirma,
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
                                  onTap: toggleObscuredSenhaConfirma,
                                  child: Icon(
                                    obscuredSenhaConfirma
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
                                    onPressed: alunoLoginStores.getClickLogin ? (){}:() async {
                                      alunoLoginStores.setClickLogin(true);
                                      bool senhaMudada = false;
                                      if (!appStores.getUserResponsavel){
                                          senhaMudada = await alunoLoginStores.mudaSenha(
                                          senhaAntigaController.text, 
                                          senhaController.text, 
                                          senhaconfirmController.text, 
                                          alunoStores.aluno!,
                                        );
                                      }else{
                                          senhaMudada = await alunoLoginStores.mudaSenhaResponsavel(
                                          senhaAntigaController.text, 
                                          senhaController.text, 
                                          senhaconfirmController.text, 
                                          responsavelStores.responsavel!,
                                        );
                                      }
                                      

                                      if(senhaMudada){
                                        senhaAntigaController.clear();
                                        senhaController.clear();
                                        senhaconfirmController.clear();
                                      }
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          
                                          content: Text(alunoLoginStores.mensagem,
                                            style: TextStyle(
                                              color: senhaMudada ? Colors.black : Colors.white
                                            ),
                                          ),
                                          backgroundColor: senhaMudada ? Colors.greenAccent : Colors.redAccent,
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
                                      const Text("Salvar",
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
  void toggleObscuredSenhaAntiga() {
    setState(() {
      obscuredSenhaAntiga = !obscuredSenhaAntiga;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredSenhaNova() {
    setState(() {
      obscuredSenhaNova = !obscuredSenhaNova;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredSenhaConfirma() {
    setState(() {
      obscuredSenhaConfirma = !obscuredSenhaConfirma;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

}