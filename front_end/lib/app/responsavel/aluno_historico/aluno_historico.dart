import 'package:access_control/app/inicio/inicio.dart';
import 'package:access_control/app/logs/logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../widgets/colors/colors.dart';
import '../widgets/body_alunoHistorico.dart';

class AlunoHistorico extends StatefulWidget {
  const AlunoHistorico({super.key});

  @override
  State<AlunoHistorico> createState() => _AlunoHistoricoState();
}

class _AlunoHistoricoState extends State<AlunoHistorico> {
  
  TextEditingController dataInicioController = TextEditingController();
  TextEditingController dataFimController = TextEditingController();

  DateTime? dataInicio;
  DateTime? dataFim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: verdeContainerPadrao,
        title: const Text("Histórico"),
      ),
      drawer: Drawer(
        child: Observer(
          builder: (context){
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: ListTile(
                    title: Text(
                      "Filtros",
                      style: TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      "Faça buscas do histórico a partir de uma data ou em um intervalo entre duas datas.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: dataInicioController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      label: Text("Insira a data inicial")
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(2011), 
                        lastDate: DateTime(2101)
                      );

                      if (pickeddate != null){
                        setState(() {
                          dataInicioController.text = DateFormat("dd/MM/yyyy").format(pickeddate);
                          dataInicio = pickeddate;
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: dataFimController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      label: Text("Insira a data final")
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(2011), 
                        lastDate: DateTime(2101),
                      );

                      if (pickeddate != null){
                        setState(() {
                          dataFimController.text = DateFormat("dd/MM/yyyy").format(pickeddate);
                          dataFim = pickeddate;
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async{
                        FocusScope.of(context).requestFocus(FocusNode());
                        await alunoLoginStores.atualizaTokenAccess();
                        responsavelStores.setListaAtualizada(false);
                        await responsavelStores.getHistoricoAluno(
                          alunoLoginStores.getTokens, responsavelStores.getIdAlunoHistoricoListado,
                          dataInicio, dataFim 
                        );
                        if(responsavelStores.getListaAtualizada){
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const AlunoHistorico())
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: azulBotaoSucessoPadrao
                      ), 
                      child: const Text("BUSCAR", style: TextStyle(fontSize: 20),)
                    ),
                  ),
                )
              ],
            );
          }
        ),  
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const[
              
              BodyAlunoHistorico()
            ],
          ),
        ),
      ),
    );
  }

  SnackBar erroValid(){
    return SnackBar(
      content: const Text("Datas inválidas, verfique as datas novamente e tente novamente.",
        style: TextStyle(color: Colors.white)
      ),
      backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        label: 'Fechar',
        textColor: Colors.black,
        onPressed: (){},
      ),
    );
  }
}
