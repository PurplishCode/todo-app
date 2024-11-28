import 'package:flutter/material.dart';
import 'package:todoapp/auth/screens/signin.dart';
import 'package:todoapp/auth/screens/signup.dart';

Route<void> generateRoutes(RouteSettings routeSettings) {
  print("Navigated to: ${routeSettings.name}");
  switch(routeSettings.name) {
    case(SignIn.screenName): return _pageRoutes(routesName: '/signin', routesView: const SignIn());
    break;
    case(SignUp.screenName): return _pageRoutes(routesName: '/signup', routesView: const SignUp());
    break;
    // Add more cases correspondingly.
    default: return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("404 Not Found", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),),));
  }

}
PageRoute _pageRoutes({String? routesName, Widget? routesView}) {
  return MaterialPageRoute(settings: RouteSettings(name: routesName),builder: (context) => routesView!);
}