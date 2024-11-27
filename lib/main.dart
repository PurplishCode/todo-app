import 'package:flutter/material.dart';
import 'package:todoapp/signup.dart';

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
    return const MaterialApp(home:SignUp(),debugShowCheckedModeBanner: false,);
  }
}
