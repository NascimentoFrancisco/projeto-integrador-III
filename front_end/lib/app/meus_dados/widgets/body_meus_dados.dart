
import 'package:access_control/app/logs/logs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/botoes/botoes.dart';
import '../../widgets/colors/colors.dart';
import '../../widgets/logos/logos.dart';

class BodyMeusDados extends StatefulWidget {
  const BodyMeusDados({super.key});

  @override
  State<BodyMeusDados> createState() => _BodyMeusDadosState();
}

class _BodyMeusDadosState extends State<BodyMeusDados> {

  String dataNascimento = DateFormat('dd/MM/yyyy').format(DateTime.now());


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
                             
              fazWidgetsDados("Nome:", alunoStores.aluno!.nome),
              fazWidgetsDados("CPF:", alunoStores.aluno!.user.cpf),
              fazWidgetsDados("Matrícula:", alunoStores.aluno!.user.matricula),
              fazWidgetsDados("Data de nascimento:", alunoStores.aluno!.dataNascimento),
              fazWidgetsDados("Email:", alunoStores.aluno!.user.email),
              fazWidgetsDados("Curso:", alunoStores.aluno!.curso.titulo),
              fazWidgetsDados("Turno:", alunoStores.aluno!.curso.turno),
              
              retornaBotaoVoltarEsquerto(context),
            ],
          ),
        ),
      ),
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
                    child: Text(titulo,
                      style: TextStyle(
                        color: textoBrancoPadrao,
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