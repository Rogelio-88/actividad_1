import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RiveAnimation.asset( 'assets/animated_login_character.riv')
          ],
        )),
    );
  }
}