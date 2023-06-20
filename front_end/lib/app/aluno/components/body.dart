// ignore_for_file: use_build_context_synchronously

import 'package:access_control/app/aluno/components/gerar_qrcode/gerar_qrcode.dart';
import 'package:access_control/app/logs/logs.dart';
import 'package:access_control/app/meus_dados/widgets/mudar_senha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import '../../meus_dados/meus_dados.dart';
import '../../widgets/colors/colors.dart';
import '../../widgets/logos/logos.dart';

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
                    return Text(formataNome(alunoStores.aluno!.nome),
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
                      onPressed: alunoStores.aluno?.nome == null ? (){}:(){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const MeusDados())
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
              Center(
                child: Observer(
                  builder: (context){
                    return ElevatedButton(
                      onPressed: !alunoStores.alunoInstanciado ? (){}:()async{
                        alunoLoginStores.setTipoQrcode("Entrada");
                        await alunoLoginStores.atualizaTokenAccess();
                        alunoLoginStores.setDadosQrCode();
                        alunoLoginStores.countSeconds();
                        
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const GerarQrCodes())
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
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Observer(
                builder: (context){
                  return Center(
                    child: ElevatedButton(
                      onPressed: alunoStores.aluno?.nome == null ? (){}:()async{
                        alunoLoginStores.setTipoQrcode("Saída");
                        await alunoLoginStores.atualizaTokenAccess();
                        alunoLoginStores.setDadosQrCode();
                        alunoLoginStores.countSeconds();
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const GerarQrCodes())
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
                      onPressed: alunoStores.aluno?.nome == null ? (){}:(){
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
                                                  alunoStores.setalunoInstanciado(false);
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