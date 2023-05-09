
import 'package:flutter/material.dart';

Widget retornaBotaoVoltarEsquerto(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
  );
}

Widget retornaBotaoVoltarParao(BuildContext context){
  return ElevatedButton(
    onPressed: (){
      Navigator.of(context).pop();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red
    ),
    child: const Text("Voltar",
      style: TextStyle(
        fontSize: 28
      ),
    )
  );
}