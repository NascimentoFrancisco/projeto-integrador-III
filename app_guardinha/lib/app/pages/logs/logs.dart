// ignore_for_file: use_build_context_synchronously

import 'package:app_guardinha/app/colors/colors.dart';
import 'package:app_guardinha/app/pages/home/home.dart';
import 'package:app_guardinha/app/pages/user_page/user_page.dart';
import 'package:app_guardinha/main.dart';
import 'package:flutter/material.dart';

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {

  @override
  void initState() {
    super.initState();

    guardaStores.checkLogin().then((value)async{

      if(value){
        await guardaStores.atualizaTokenAccess();
        await guardaStores.getGuarda(guardaStores.getTokens);

        if(guardaStores.guarda != null){
          Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => const HomeUser())
          );

        }else{

          await guardaStores.apagaTokens();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(guardaStores.mensagem,
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
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Inicio())
          );
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
    return Scaffold(
      backgroundColor: ColorsApp().textoBrancoPadrao,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text("Aguarde..."),
            ),
            CircularProgressIndicator(),
          ],
        )
      ),
    );
  }
}