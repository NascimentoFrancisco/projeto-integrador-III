import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/widgets/logo.dart';
import 'package:app_guardinha/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MeusDados extends StatefulWidget {
  const MeusDados({super.key});

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp().verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)  
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 28, bottom: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              retornaLogoRedondo(context)
                            ],
                          ),
                        ),

                        fazWidgetsDados("Nome:", guardaStores.guarda!.nome),
                        fazWidgetsDados("CPF:", guardaStores.guarda!.user.cpf),
                        fazWidgetsDados("Data de nasciemnto:", guardaStores.guarda!.dataNascimento),
                        fazWidgetsDados("Email:", guardaStores.guarda!.user.email),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 40.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red
                                ),
                                child: const Text("Voltar",
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget fazWidgetsDados(String titulo, var dado){

    if (dado is DateTime){
      dado = DateFormat('dd/MM/yyyy').format(dado);
    } else {
      dado = dado.toString();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp().azulBotaoSucessoPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                    child: Text(titulo,
                      style: TextStyle(
                        color: ColorsApp().textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text(dado,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}