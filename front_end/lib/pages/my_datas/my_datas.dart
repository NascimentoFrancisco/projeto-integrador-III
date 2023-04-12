
import 'package:access_control/pages/my_datas/componets/body_my_datas.dart';
import 'package:flutter/material.dart';

class MyDatas extends StatefulWidget {
  const MyDatas({super.key});

  @override
  State<MyDatas> createState() => _MyDatasState();
}

class _MyDatasState extends State<MyDatas> {
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
              BodyMyDatas()
            ],
          ),
        ),
      )
    );
  }
}