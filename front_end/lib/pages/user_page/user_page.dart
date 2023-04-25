
import 'package:access_control/pages/login/login.dart';
import 'package:access_control/pages/user_page/home_user.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  /* @override
  void initState() {

    super.initState();

    loginStores.pegaToken();
    alunoStores.getAluno(loginStores.token!);

  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const[
              Body(),  
            ],
          ),
        ),
      )
    );
  }
}