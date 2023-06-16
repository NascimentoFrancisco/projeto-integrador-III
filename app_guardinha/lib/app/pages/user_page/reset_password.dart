import 'package:app_guardinha/app/colors/colors.dart';
import 'package:flutter/material.dart';


class MudarSenha extends StatefulWidget {
  const MudarSenha({super.key});

  @override
  State<MudarSenha> createState() => _MudarSenhaState();
}

class _MudarSenhaState extends State<MudarSenha> {

  final textFieldFocusNode = FocusNode();

  bool obscuredSenhaAntiga = true;
  bool obscuredSenhaNova = true;
  bool obscuredSenhaConfirma = true;

  TextEditingController senhaAntigaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaconfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().textoBrancoPadrao,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: MediaQuery.of(context).size.height*1,
                    decoration: BoxDecoration(
                      color: ColorsApp().verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 40),
                            child: Text("Mudança de senha",
                              style: TextStyle(
                                color: ColorsApp().textoBrancoPadrao,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextField(
                              obscureText: obscuredSenhaAntiga,
                              controller: senhaAntigaController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsApp().textoBrancoPadrao,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextField(
                              obscureText: obscuredSenhaNova,
                              controller: senhaController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsApp().textoBrancoPadrao,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextField(
                              obscureText: obscuredSenhaConfirma,
                              controller: senhaconfirmController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsApp().textoBrancoPadrao,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      fontSize: 28
                                    ),
                                  )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsApp().azulBotaoSucessoPadrao
                                    ), 
                                    child: const Text("Salvar",
                                      style: TextStyle(
                                        fontSize: 25
                                      ),
                                    )
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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

  void toggleObscuredSenhaAntiga() {
    setState(() {
      if (!obscuredSenhaNova){
        obscuredSenhaNova = !obscuredSenhaNova;
      }
      if(!obscuredSenhaConfirma){
        obscuredSenhaConfirma = !obscuredSenhaConfirma;
      }
      obscuredSenhaAntiga = !obscuredSenhaAntiga;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredSenhaNova() {
    setState(() {
      if (!obscuredSenhaAntiga){
        obscuredSenhaAntiga = !obscuredSenhaAntiga;
      }
      if(!obscuredSenhaConfirma){
        obscuredSenhaConfirma = !obscuredSenhaConfirma;
      }
      obscuredSenhaNova = !obscuredSenhaNova;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void toggleObscuredSenhaConfirma() {
    setState(() {
      if (!obscuredSenhaAntiga){
        obscuredSenhaAntiga = !obscuredSenhaAntiga;
      }
      if(!obscuredSenhaNova){
        obscuredSenhaNova = !obscuredSenhaNova;
      }
      obscuredSenhaConfirma = !obscuredSenhaConfirma;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;     
    });
  }

}
