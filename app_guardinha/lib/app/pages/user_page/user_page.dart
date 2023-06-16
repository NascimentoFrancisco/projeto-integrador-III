import 'package:app_guardinha/app/pages/user_page/body_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {

  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context){
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  BodyUserPage(),
                ],
              ),
            ),
          )
        );
      }
    );
  }


  /* Widget determinaBody(){
    if(!appStores.getUserResponsavel){
      return const Body();
    }
    return const BodyResponsavel();
  } */
}