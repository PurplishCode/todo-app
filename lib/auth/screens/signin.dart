import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const String screenName = '/signin';
  @override
  State<SignIn> createState() => _SignInPage();
}

class _SignInPage extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration:BoxDecoration(gradient: LinearGradient(colors:[Colors.indigoAccent, Colors.indigo])), child: Center(child:
    SingleChildScrollView(padding: EdgeInsets.all(12),child: Container(width:500,padding: EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.white),child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Text("SIGN IN!", style: TextStyle(fontSize: 20, fontFamily: "Montserrat", fontWeight: FontWeight.bold
    )), SizedBox(height:16), TextField(decoration: InputDecoration(labelText: "Username",prefixIcon: Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),), SizedBox(height: 20), TextField(obscureText: true,decoration: InputDecoration(labelText: "Password",prefixIcon: Icon(Icons.lock), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),), SizedBox(height: 20,), ElevatedButton(onPressed: (){}, child: Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)), style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 150), backgroundColor: Colors.indigoAccent),), SizedBox(height: 12,),Row(children: [Text("Doesn't have an account yet? "), GestureDetector(child: Text("SIGN UP!", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),), onTap: (){Navigator.pushNamed(context, '/signup');},)],)]),))),),);
  }
}

