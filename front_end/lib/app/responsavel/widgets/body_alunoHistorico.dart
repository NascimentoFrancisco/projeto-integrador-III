
import 'package:access_control/models/aluno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import '../../inicio/inicio.dart';
import '../../widgets/colors/colors.dart';


class BodyAlunoHistorico extends StatefulWidget {
  const BodyAlunoHistorico({super.key});

  @override
  State<BodyAlunoHistorico> createState() => _BodyAlunoHistoricoState();
}

class _BodyAlunoHistoricoState extends State<BodyAlunoHistorico> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Observer(
          builder: (context){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                            
                for(HistoricoAluno aluno in responsavelStores.listHistoricoAluno)
                  fazWidgetsDados(aluno),
                
                if (responsavelStores.listHistoricoAluno.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.height*1,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                          color: Colors.red
                        ),
                        child: const Center(
                          child: Text("ALUNO SEM HISTÓRICO",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ),
              ],
            );
          }
        )
      ),
    );
  }

  Widget fazWidgetsDados(HistoricoAluno alunoParaHistorico){

    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4, left: 4),
        child: Container(
          decoration: BoxDecoration(
            color: azulBotaoSucessoPadrao,
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
                    child: Text("Nome: ${alunoParaHistorico.aluno.nome}",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 10),
                    child: Text("Data de nascimento: ${DateFormat('dd/MM/yyyy').format(alunoParaHistorico.aluno.dataNascimento)}",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                    child: Text("Tipo de movimentação: ${alunoParaHistorico.tipoMovimentacao}",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text("Data e Horário: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(alunoParaHistorico.criadoEm)}",
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