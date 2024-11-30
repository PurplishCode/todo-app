import 'package:flutter/material.dart';
import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String token;

  User({required this.id, required this.fullName, required this.email, required this.password, required this.token});
  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email':email,
      'token':token,
      'password':password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User (
      id: map['_id'] ?? '',

    fullName: map['full_name'] ?? '',

    email: map['email'] ?? '',
    token: map['token'] ?? '',

    password: map['password'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));


}

class UserProvider extends ChangeNotifier {
  User _user = User(id: '', fullName: '', email: '', password: '', token: '');

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
  User get user => _user;
}