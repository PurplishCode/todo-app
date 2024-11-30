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

    return Scaffold(appBar: AppBar(title: Text("Welcome abroad, ${uProvider.user.fullName}"),), body: SingleChildScrollView(child: Column(children: [ ElevatedButton(onPressed: (){ authService.signOut(context); }, child: const Text("SIGN OUT", style: TextStyle(color:Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),) ],),),);
  }
}

