import 'package:access_control/app/responsavel/widgets/body_dados_responsavel.dart';
import 'package:flutter/material.dart';

class MeusDadosResponsavel extends StatefulWidget {
  const MeusDadosResponsavel({super.key});

  @override
  State<MeusDadosResponsavel> createState() => _MeusDadosResponsavelState();
}

class _MeusDadosResponsavelState extends State<MeusDadosResponsavel> {
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
              BodyMeusDadosResponsavel()
            ],
          ),
        ),
      )
    );
  }
}