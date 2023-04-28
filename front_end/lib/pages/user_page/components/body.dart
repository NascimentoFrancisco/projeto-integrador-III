import 'package:access_control/pages/my_datas/componets/change_password.dart';
import 'package:access_control/pages/my_datas/my_datas.dart';
import 'package:access_control/pages/user_page/home_user.dart';
import 'package:access_control/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../colors/cores_padroes.dart';
import '../../generator_qrcode/genereator_qrcode.dart';
import '../../login/login.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: verdeContainerPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40
              ),
              retornaLogoRedondo(context),
              const SizedBox(
                height: 25
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Observer(
                  builder: (context){
                    return Text(formataNome(alunoStores.aluno?.nome),
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Observer(
                builder: (context){
                  return Center(
                    child: ElevatedButton(
                      onPressed: alunoStores.aluno?.nome == null ? (){} : () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const MyDatas()))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azulBotaoSucessoPadrao,
                      minimumSize: const Size(300, 50)
                    ), 
                    child: Text("Meus dados",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                );
                }
              ),
              const SizedBox(
                height: 35,
              ),
              Observer(
                builder: (context){
                  return Center(
                    child: ElevatedButton(
                      onPressed: alunoStores.aluno?.nome == null ? (){} : (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const GeneratorQRCode()))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azulBotaoSucessoPadrao,
                      minimumSize: const Size(300, 50)
                    ), 
                    child: Text("Gerar QRCode de entrada",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                );
                }
              ),
              const SizedBox(
                height: 35,
              ),
              Observer(
                builder: (context){
                  return Center(
                    child: ElevatedButton(
                      onPressed: alunoStores.aluno?.nome == null ? (){} : (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const GeneratorQRCode()))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azulBotaoSucessoPadrao,
                      minimumSize: const Size(300, 50)
                    ), 
                    child: Text("Gerar QRCode de saída",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                );
                }
              ),
              const SizedBox(
                height: 35,
              ),
              Observer(
                builder: (context){
                  return Center(
                    child: ElevatedButton(
                      onPressed: alunoStores.aluno?.nome == null ? (){} : (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const ChangePassword()))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: azulBotaoSucessoPadrao,
                      minimumSize: const Size(300, 50)
                    ), 
                    child: Text("Mudar senha",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                );
                }
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: ()async{
                        bool log = await loginStores.sairLogin();
                        if (!log){
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context) => const HomeUser())
                          );
                        }
                      }, 
                      child: Text("Sair",
                        style: TextStyle(
                          color: textoBrancoPadrao,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double
                        ),
                      )
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  String formataNome(String? nome){

    if (nome == null){
      return "Aguarde...";
    }

    String nomeFormatado= "";
    List<String> nomelist = nome.split(" ");
    
    if (nomelist[1] == "da" || nomelist[1] == "de" || nomelist[1] == "do"){
      for(int index = 0; index < 3; index ++){
        if(index == 0){
          nomeFormatado += nomelist[index];
        } else{
          nomeFormatado += " ${nomelist[index]}";
        }
      }
    }else{
      for(int index = 0; index < 2; index ++){
        if(index == 0){
          nomeFormatado += nomelist[index];
        } else{
          nomeFormatado += " ${nomelist[index]}";
        }
      }
    }

    return "Olá, $nomeFormatado";
  }

}