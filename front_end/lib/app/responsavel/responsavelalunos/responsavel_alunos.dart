import 'package:access_control/app/inicio/inicio.dart';
import 'package:access_control/models/aluno.dart';
import 'package:flutter/material.dart';

import '../../widgets/botoes/botoes.dart';
import '../../widgets/colors/colors.dart';
import '../../widgets/logos/logos.dart';

class ResponsavelAlunos extends StatefulWidget {
  const ResponsavelAlunos({super.key});

  @override
  State<ResponsavelAlunos> createState() => _ResponsavelAlunosState();
}

class _ResponsavelAlunosState extends State<ResponsavelAlunos> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                      color: verdeContainerPadrao,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                          Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              retornaLogoRedondo(context)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        
                        for (Aluno aluno in responsavelStores.listaAlunos)
                          fazWidgetsDados(aluno),
                        
                        if (responsavelStores.listaAlunos.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.height*1,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                                color: Colors.red
                              ),
                              child: const Center(
                                child: Text("NENHUM ALUNO ENCONTRADO",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )
                          ), 
                        const SizedBox(
                          height: 40,
                        ),     
                        retornaBotaoVoltarEsquerto(context),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget fazWidgetsDados(Aluno aluno){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.height*1,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: azulBotaoSucessoPadrao,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                    child: Text("Aluno(a):",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text(aluno.nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                    child: Text("Curso:",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text(aluno.curso.titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }

}

