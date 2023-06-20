// ignore_for_file: use_build_context_synchronously

import 'package:access_control/app/inicio/inicio.dart';
import 'package:access_control/app/responsavel/meus_dados.dart';
import 'package:access_control/app/responsavel/responsavelalunos/responsavel_alunos.dart';
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
                      onPressed: responsavelStores.getClickedBotao ? (){}:() async {
                        
                        responsavelStores.setClickedBotao(true);
                        await alunoLoginStores.atualizaTokenAccess();
                        await responsavelStores.getAlunoResponsavel(alunoLoginStores.getTokens);
                        responsavelStores.setClickedBotao(false);
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ResponsavelAlunos())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: azulBotaoSucessoPadrao,
                        minimumSize: const Size(300, 50)
                      ), 
                      child: Text(responsavelStores.getClickedBotao ? "Aguarde..." :"Ver histórico aluno(s)",
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
                      onPressed: alunoStores.aluno?.nome == null ? (){}: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                          return WillPopScope(
                            onWillPop: () async => false, 
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                content: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                    onTap: () {}, 
                                    child: AlertDialog(
                                      title: const Text('Logout'),
                                      content: const Text('Você realmente deseja sair do sistema?'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          child: const Text('Cancelar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        Observer(
                                          builder: (context){
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: azulBotaoSucessoPadrao,
                                              ),
                                              onPressed: alunoLoginStores.getClickLogin ? (){}: () async{
                                                alunoLoginStores.setClickLogin(true);
                                                bool logout = await alunoLoginStores.apagaTokens();
                                                if(!logout){
                                                  responsavelStores.setResponsavelInstanciado(false);
                                                  Navigator.of(context).pop();
                                                  Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) => const Logs())
                                                  );
                                                }
                                                alunoLoginStores.setClickLogin(false);

                                              },
                                              child: alunoLoginStores.getClickLogin ?  
                                              const CircularProgressIndicator(
                                                color: Colors.white,
                                              ):
                                              const Text('Confirmar'),
                                            );
                                          }
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
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