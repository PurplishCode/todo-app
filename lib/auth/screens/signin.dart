import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/auth/services/auth_service.dart';
import 'package:todoapp/constants/utils/logger.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const String screenName = '/signin';
  @override
  State<SignIn> createState() => _SignInPage();
}

class _SignInPage extends State<SignIn> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  void signInUser(BuildContext context) async {
    try {
    final successful =   await authService.signInUser(context: context, email: emailController.text, password: passwordController.text);
    if(successful) {
      AppLogger.logInfo("Successfully logged inside, welcome abroad user!");
    }
    }catch(e){
      rethrow;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration:const BoxDecoration(gradient: LinearGradient(colors:[Colors.indigoAccent, Colors.indigo])), child: Center(child:
    SingleChildScrollView(padding: const EdgeInsets.all(12),child: Container(width:500,padding: const EdgeInsets.all(20),decoration: const BoxDecoration(color: Colors.white),child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [const Text("SIGN IN!", style: TextStyle(fontSize: 20, fontFamily: "Montserrat", fontWeight: FontWeight.bold
    )), const SizedBox(height:16), TextField(controller: emailController,decoration: InputDecoration(labelText: "E-mail",prefixIcon: const Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),), const SizedBox(height: 20), TextField(controller: passwordController,obscureText: true,decoration: InputDecoration(labelText: "Password",prefixIcon: const Icon(Icons.lock), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),), const SizedBox(height: 20,), ElevatedButton(onPressed: (){signInUser(context);}, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 150), backgroundColor: Colors.indigoAccent), child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),), const SizedBox(height: 12,),Row(children: [const Text("Doesn't have an account yet? "), GestureDetector(child: const Text("SIGN UP!", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),), onTap: (){Navigator.pushNamed(context, '/signup');},)],)]),))),),);
  }
}

