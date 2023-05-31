import 'package:access_control/app/inicio/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../aluno/components/body.dart';
import '../responsavel/body_responsavel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context){
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  determinaBody(),
                ],
              ),
            ),
          )
        );
      }
    );
  }


  Widget determinaBody(){
    if(!appStores.getUserResponsavel){
      return const Body();
    }
    return const BodyResponsavel();
  }
}