import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 76, 0, 2),
      body: Center(
        child: Container(
          width: 500,
          height: 180,
          alignment: Alignment.center,
          child: Image.asset('assets/Eazz_logo.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
