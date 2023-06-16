import 'package:flutter/material.dart';

Widget retornaLogo(){
  return Center(
     // ignore: sized_box_for_whitespace
    child: Container(
    height: 160,
    child: const Image(image: AssetImage('assets/images/logo-remove.png')),
    ),
  );
}

Widget retornaLogoRedondo(BuildContext context){
  return ElevatedButton(
    onPressed: (){
      mostraSobre(context);
    },
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
    ), 
    child: Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(image: AssetImage('assets/images/logo-remove.png')),
      )
    ),
  );
}

void mostraSobre(BuildContext context){
  
  String textoSobre = 
  "Este aplicativo foi desenvolvido a fim de monitorar a entrada e saída de alunos no campus"
  " e ajudar os responsáveis dos alunos a os acompnharem na escola. \n\n"
  "Projeto desenvolvido pelo aluno Francisco Leite do Nascimento para a disciplina "
  "Projeto Integrador III no Módulo V do curso Análise e Desenvolvimento de Sistemas.";

  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: const Text("Sobre",
        textAlign: TextAlign.center,
      ),
      content: Text(textoSobre,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 17,
          ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, 
          child: const Text("Fechar!")
        )
      ],
    )
  );
}