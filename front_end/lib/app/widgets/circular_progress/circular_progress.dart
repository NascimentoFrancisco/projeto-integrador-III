
import 'package:flutter/material.dart';

class CircularrpgressorApp extends StatelessWidget {
  const CircularrpgressorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}