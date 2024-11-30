import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/auth/screens/signup.dart';
import 'package:todoapp/providers/user_provider.dart';
import 'package:todoapp/routes.dart';

void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (ctx) => UserProvider())], child: const HomeStateful(),));
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStateful();
}

class _HomeStateful extends State<HomeStateful> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUp(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
    );
  }
}
