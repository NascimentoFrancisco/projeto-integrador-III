import 'package:access_control/pages/home/home.dart';
import 'package:access_control/pages/my_datas/componets/change_password.dart';
import 'package:access_control/pages/my_datas/my_datas.dart';
import 'package:access_control/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../../../colors/cores_padroes.dart';
import '../../generator_qrcode/genereator_qrcode.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                height: 40
              ),
              retornaLogoRedondo(context),
              const SizedBox(
                height: 25
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Olá, Francisco Nascimento",
                  style: TextStyle(
                    color: textoBrancoPadrao,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const MyDatas()))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulBotaoSucessoPadrao,
                    minimumSize: const Size(300, 50)
                  ), 
                  child: Text("Meus dados",
                    style: TextStyle(
                      color: textoBrancoPadrao,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const GeneratorQRCode()))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulBotaoSucessoPadrao,
                    minimumSize: const Size(300, 50)
                  ), 
                  child: Text("Gerar QRCode",
                    style: TextStyle(
                      color: textoBrancoPadrao,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const ChangePassword()))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulBotaoSucessoPadrao,
                    minimumSize: const Size(300, 50)
                  ), 
                  child: Text("Mudar senha",
                    style: TextStyle(
                      color: textoBrancoPadrao,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder: (context) => const HomePage())
                      );
                    }, 
                    child: Text("Sair",
                      style: TextStyle(
                        color: textoBrancoPadrao,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double
                      ),
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}