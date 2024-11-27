import 'package:flutter/material.dart';
import 'package:todoapp/signin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.indigo, title: Text('ToDo App', style: TextStyle(color: Colors.white),),),
      body: Center(child:
    SingleChildScrollView(padding: EdgeInsets.all(20),
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.center
      , children:
          [
            Text("Create Account", style: TextStyle(fontFamily: "Times New Roman", fontSize: 20),),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: 'Username', prefixIcon: Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))), SizedBox(height:15),
            TextField(obscureText: true,decoration: InputDecoration(labelText: "Passowrd", prefixIcon: Icon(Icons.key), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),), SizedBox(height:20),
            ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.indigoAccent), child:
          const Text("Register", style: TextStyle(fontSize: 15, fontFamily: "Calibri", color: Colors.white),),), SizedBox(height: 15), Row(children: [Text("Already have an account? "), GestureDetector(onTap: (){ const SignIn(); }, child: Text("Login!", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),)],)]))));
  }

}