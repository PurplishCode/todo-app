import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/auth/services/auth_service.dart';
import 'package:todoapp/providers/user_provider.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _Baseline();
}

class _Baseline extends State<Base> {
  @override

  Widget build(BuildContext context) {

    AuthService authService = AuthService();
    var uProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(appBar: AppBar(backgroundColor: Colors.indigoAccent,title: Text("Note application", style: TextStyle(fontFamily: 'Montserrat',color: Colors.white),),), body: SingleChildScrollView(child: Column(children: [ SizedBox(height: 10,),Container(decoration: BoxDecoration(color: Colors.blue),padding: EdgeInsets.all(30),child: const Text("Hai")),SizedBox(height: 15,),ElevatedButton(onPressed: (){ authService.signOut(context); }, child: const Text("SIGN OUT", style: TextStyle(color:Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),) ],),),);
  }
}

