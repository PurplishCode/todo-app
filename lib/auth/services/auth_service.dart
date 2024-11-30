import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import  'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/auth/screens/signin.dart';
import 'package:todoapp/constants/utils/logger.dart';
import 'package:todoapp/constants/utils/tools.dart';
import 'package:todoapp/home/home_screen.dart';

import '../../providers/user_provider.dart';
class AuthService {
  signUpUser({required BuildContext context, required String fullName, required String email, required String password}) async {
    try {
      final client = http.Client();
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      var navigator = Navigator.of(context);
      var signUpUri = '$baseUrl/api/signup';

      http.Response response = await client.post(Uri.parse(signUpUri), body: jsonEncode({'full_name': fullName, 'email': email, 'password': password}), headers: <String, String>{"Content-Type":"application/json;charset=utf-8"});
      httpErrorHandler(response: response, context: context, onSuccess: () async {
        userProvider.setUser(response.body);
        showSnackBar(context, "Succesfully created an account!");
        AppLogger.logInfo(response.body);
        navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => SignIn()), (route) => false);
      });
    } catch(e){
      AppLogger.logError('$e');
    }
  }

  signInUser({required BuildContext context, required String email, required String password}) async {
try {
final client = http.Client();
var userProvider = Provider.of<UserProvider>(context, listen: false);
final navigator = Navigator.of(context);

// API endpoint for POST (login) to Express.
const loginUri = '$baseUrl/api/signin';

http.Response response = await client.post(Uri.parse(loginUri), body: jsonEncode({'email':email,'password':password}),headers: <String, String>{'Content-Type':'application/json; charset=utf-8'});
httpErrorHandler(response: response, context: context, onSuccess: () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userProvider.setUser(response.body);

  await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
  showSnackBar(context, "Succesfully logged in!");
  navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Base()), (route) => false);

});

  }catch(e){
    rethrow;
  }
}

  void signOut(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('x-auth-token');
      final navigator = Navigator.of(context);
      showSnackBar(context, "Succesfully logged out.");
      navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => const SignIn()), (route) => false);

}catch(e){
  rethrow;
}
  }
}
