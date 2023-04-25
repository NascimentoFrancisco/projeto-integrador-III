
import 'package:access_control/pages/home/home.dart';
import 'package:access_control/pages/user_page/user_page.dart';
import 'package:access_control/stores/login.stores.dart';
import 'package:access_control/widgets/circular_progressor.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';


final loginStores = LoginStores();

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {

  @override
  void initState() {

    super.initState();
    
    loginStores.checkLogin().then((value) {
      if (value){
        loginStores.pegaToken();
        alunoStores.getAluno(loginStores.token!);
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserPage())
        );
      } else {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      }
    });      

  }

  @override
  Widget build(BuildContext context) {
    return const CircularrpgressorApp();
  }

}