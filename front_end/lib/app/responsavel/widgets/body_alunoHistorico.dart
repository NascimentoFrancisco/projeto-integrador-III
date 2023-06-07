
import 'package:access_control/models/aluno.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../inicio/inicio.dart';
import '../../widgets/botoes/botoes.dart';
import '../../widgets/colors/colors.dart';
import '../../widgets/logos/logos.dart';

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
        child: Container(
          decoration: BoxDecoration(
            color: verdeContainerPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    retornaLogoRedondo(context)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              
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
              retornaBotaoVoltarEsquerto(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget fazWidgetsDados(HistoricoAluno alunoParaHistorico){

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 10),
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
                    child: Text("Nome: ",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text(alunoParaHistorico.aluno.nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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