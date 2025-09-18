import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Estado para mostrar/ocultar contraseña
  bool _obscurePassword = true;

// cerebro de las animaciones
  StateMachineController? controller;
  SMIBool? isChecking; //ver lo que escribes
  SMIBool? isHandsUp; //se tapa los ojos
  SMITrigger? trigSuccess; //cuando acierta
  SMITrigger? trigFail; //cuando falla

  @override
  Widget build(BuildContext context) {
    //obtener el tamaño de la pantalla
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  'assets/animated_login_character.riv',
                  stateMachines: const ["login machine"],
                  //al iniciarse la animación
                  onInit: (artboard) {
                    controller=StateMachineController as StateMachineController?;
                     StateMachineController.fromArtboard(
                      artboard,
                      "LOGIN Machine",
                    );
                    //VERIFICAR QUE INICA BIEN
                    if (controller != null) return;
                    artboard.addController(controller!);

                    isChecking = controller!.findSMI("IsChecking");
                    isHandsUp = controller!.findSMI("isHandsUp");
                    trigSuccess = controller!.findSMI("trigSuccess");
                    trigFail = controller!.findSMI("trigFail");
                  },
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              // Campo de texto Email
              TextField(
                onChanged: (value) {
                  if (isHandsUp != null) {
                    //no tapar los ojos
                    isHandsUp!.change(false);
                  }
                  if (isChecking == null) return;
                  //si hay texto, activar isChecking
                  isChecking!.change(true);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Introduce tu Email",
                  prefixIcon: const Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Campo de texto Contraseña con ojito invertido
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility // 👁 normal cuando está oculta
                          : Icons
                              .visibility_off, // 🚫 tachado cuando está visible
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: size.width,
                  child: const Text("forgot your password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.underline))),
              const SizedBox(height: 20),
              MaterialButton(
                  onPressed: () {},
                  color: const Color.fromARGB(255, 243, 33, 198),
                  minWidth: size.width,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {},
                      child: const Text("register",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}