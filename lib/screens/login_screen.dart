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
    final sise sise=MediaQuery(data: data, child: child)
    return Scaffold(
      body: SafeArea(
        child: 
        SizedBox(
          width: sise,
          
          builder: (context, state) {
            return Column(
                  children: [
                    RiveAnimation.asset( 'assets/animated_login_character.riv')
                  ],
                );
          },
        )),
    );
  }
