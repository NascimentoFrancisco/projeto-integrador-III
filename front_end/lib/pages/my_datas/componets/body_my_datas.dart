import 'package:access_control/pages/student/models.dart';
import 'package:access_control/widgets/botao_voltar.dart';
import 'package:access_control/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../colors/cores_padroes.dart';

class BodyMyDatas extends StatefulWidget {
  const BodyMyDatas({super.key});

  @override
  State<BodyMyDatas> createState() => _BodyMyDatasState();
}

class _BodyMyDatasState extends State<BodyMyDatas> {

  String dataNascimento = DateFormat('dd/MM/yyyy').format(DateTime.now());

  DadosAluno dados = DadosAluno(
    nome: "Aluno para testes de desenvolvimento", 
    cpf: "000.000.000-00", 
    matricula: "2020121SIGLA00", 
    dataNascimento: DateTime(1998, 10, 04),
    email: "aluno.ads@aluno.ifpi.edu.br",
    curso: "Análise e Desenvolvimento de Sistemas",
    turno: "Noturno" 
  );

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
                             
              fazWidgetsDados("Nome:", dados.nome),
              fazWidgetsDados("CPF:", dados.cpf),
              fazWidgetsDados("Matrícula:", dados.matricula),
              fazWidgetsDados("Data de nascimento:", dados.dataNascimento),
              fazWidgetsDados("Email:", dados.email),
              fazWidgetsDados("Curso:", dados.curso),
              fazWidgetsDados("Turno:", dados.turno),
              
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