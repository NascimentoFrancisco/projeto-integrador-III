
import 'package:access_control/app/meus_dados/widgets/body_meus_dados.dart';
import 'package:flutter/material.dart';

class MeusDados extends StatefulWidget {
  const MeusDados({super.key});

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const[
              SizedBox(
                height: 10,
              ),
              BodyMeusDados()
            ],
          ),
        ),
      )
    );
  }
}