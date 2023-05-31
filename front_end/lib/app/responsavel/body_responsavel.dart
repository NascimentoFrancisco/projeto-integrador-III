import 'package:access_control/app/inicio/inicio.dart';
import 'package:access_control/app/responsavel/meus_dados.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../logs/logs.dart';
import '../meus_dados/widgets/mudar_senha.dart';
import '../widgets/colors/colors.dart';
import '../widgets/logos/logos.dart';


class BodyResponsavel extends StatefulWidget {
  const BodyResponsavel({super.key});

  @override
  State<BodyResponsavel> createState() => _BodyResponsavelState();
}

class _BodyResponsavelState extends State<BodyResponsavel> {


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
                    return Text(formataNome(responsavelStores.responsavel!.nome),
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
                      onPressed: responsavelStores.responsavel?.nome == null ? (){}:(){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MeusDadosResponsavel())
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
                      onPressed: /* responsavelStores.responsavel?.nome == null ? */ (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: azulBotaoSucessoPadrao,
                        minimumSize: const Size(300, 50)
                      ), 
                      child: Text("Ver histórico aluno(s)",
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
                      onPressed: responsavelStores.responsavel?.nome == null ? (){}:(){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MudarSenha())
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
                      onPressed: () async{
                        bool logout = await alunoLoginStores.apagaTokens();
                        if(!logout){
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const Logs())
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