import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/auth/services/auth_service.dart';
import 'package:todoapp/constants/utils/logger.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const String screenName = '/signup';
  @override
  State<SignUp> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  AuthService authService = AuthService();
  void signUp(BuildContext context) {
    var signUp = authService.signUpUser(context: context, fullName: fullNameController.text, email: emailController.text, password: passwordController.text);
    if(signUp) {
      AppLogger.logInfo("Succesfully registered!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.indigoAccent, Colors.indigo])),
        child: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 500,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("SIGN UP",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        TextField(
                          controller: fullNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Full Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "E-mail",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {signUp(context);},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 130),
                              backgroundColor: Colors.indigoAccent),
                          child: Text("REGISTER",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text("Already have an account ? "),
                            GestureDetector(
                              child: const Text(
                                "SIGN IN!",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/signin');
                              },
                            )
                          ],
                        )
                      ]),
                ))),
      ),
    );
  }
}
