
import 'package:access_control/app/inicio/inicio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/botoes/botoes.dart';
import '../../widgets/colors/colors.dart';
import '../../widgets/logos/logos.dart';

class BodyMeusDadosResponsavel extends StatefulWidget {
  const BodyMeusDadosResponsavel({super.key});

  @override
  State<BodyMeusDadosResponsavel> createState() => _BodyMeusDadosResponsavelState();
}

class _BodyMeusDadosResponsavelState extends State<BodyMeusDadosResponsavel> {


  @override
  Widget build(BuildContext context) {
    return Padding(
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

              fazWidgetsDados("Nome:", responsavelStores.responsavel!.nome),
              fazWidgetsDados("CPF:", responsavelStores.responsavel!.user.cpf),
              fazWidgetsDados("Data de nascimento:", responsavelStores.responsavel!.dataNascimento),
              fazWidgetsDados("Email:", responsavelStores.responsavel!.user.email),
              
              retornaBotaoVoltarEsquerto(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget fazWidgetsDados(String titulo, var dado){

    if (dado is DateTime){
      dado = DateFormat('dd/MM/yyyy').format(dado);
    } else {
      dado = dado.toString();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: azulBotaoSucessoPadrao,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                    child: Text(titulo,
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                    child: Text(dado,
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
      );
  }
}