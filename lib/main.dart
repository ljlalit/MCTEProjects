import 'package:QRhelp/firstsign.dart';
import 'package:QRhelp/home.dart';
import 'package:QRhelp/signup.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'login', routes: {
      'login': (context) => login(),
      'signup': (context) => signup(),
      'home': (context) => home(),
      'firstsignin': (context) => firstsign(),
    });
  }
}
