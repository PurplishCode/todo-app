import 'package:flutter/material.dart';
import 'package:todoapp/auth/screens/signup.dart';
import 'package:todoapp/routes.dart';

void main() {
  runApp(const HomeStateful());
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStateful();
}

class _HomeStateful extends State<HomeStateful> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignUp(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
    );
  }
}
