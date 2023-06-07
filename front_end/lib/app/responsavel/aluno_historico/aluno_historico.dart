import 'package:flutter/material.dart';

import '../widgets/body_alunoHistorico.dart';

class AlunoHistorico extends StatefulWidget {
  const AlunoHistorico({super.key});

  @override
  State<AlunoHistorico> createState() => _AlunoHistoricoState();
}

class _AlunoHistoricoState extends State<AlunoHistorico> {
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
              BodyAlunoHistorico()
            ],
          ),
        ),
      )
    );
  }
}