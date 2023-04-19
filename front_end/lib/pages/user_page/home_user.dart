
import 'package:access_control/pages/login/login.dart';
import 'package:access_control/pages/user_page/user_page.dart';
import 'package:access_control/stores/login.stores.dart';
import 'package:access_control/widgets/circular_progressor.dart';
import 'package:flutter/material.dart';


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
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserPage())
        );
      } else {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginPage())
        );
      }
    });      

  }

  @override
  Widget build(BuildContext context) {
    return const CircularrpgressorApp();
  }

}