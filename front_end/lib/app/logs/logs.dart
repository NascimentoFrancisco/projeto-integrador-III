import 'package:access_control/app/home/home.dart';
import 'package:access_control/app/inicio/inicio.dart';
import 'package:access_control/stores/aluno.stores.dart';
import 'package:access_control/stores/alunologin.stores.dart';
import 'package:flutter/material.dart';

import '../widgets/circular_progress/circular_progress.dart';


AlunoLoginStores alunoLoginStores = AlunoLoginStores();
AlunoStores alunoStores = AlunoStores();

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {

  @override
  void initState() {
    
    super.initState();

    alunoLoginStores.checkLogin().then((value)async{
      if(value){
        await alunoLoginStores.atualizaTokenAccess();
        await appStores.atualizaUserTipo();

        if(appStores.getUserResponsavel){
          await responsavelStores.getResponsavel(alunoLoginStores.getTokens);

          if(responsavelStores.getResponsavelInstanciado){
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => const Home())
            ); 
          }else{
            await alunoLoginStores.apagaTokens();
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(responsavelStores.mensagem,
                  style: const TextStyle(color: Colors.white)
                ),
                backgroundColor: Colors.redAccent,
                action: SnackBarAction(
                  label: 'Fechar',
                  textColor: Colors.black,
                  onPressed: (){},
                ),
              )
            );
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Inicio())
            );
          }
        }else{
          await alunoStores.getAluno(alunoLoginStores.getTokens);
          if(alunoStores.aluno?.nome != null){
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => const Home())
            ); 
          }else{
            await alunoLoginStores.apagaTokens();
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(alunoStores.mensagem,
                  style: const TextStyle(color: Colors.white)
                ),
                backgroundColor: Colors.redAccent,
                action: SnackBarAction(
                  label: 'Fechar',
                  textColor: Colors.black,
                  onPressed: (){},
                ),
              )
            );
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Inicio())
            );
          }
        }
      }else{
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Inicio())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return const CircularrpgressorApp();
  }

}