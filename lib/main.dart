import 'dart:developer';

import 'package:QRhelp/adminhome.dart';
import 'package:QRhelp/firstsign.dart';
import 'package:QRhelp/home.dart';
import 'package:QRhelp/homenav.dart';
import 'package:QRhelp/homeqr.dart';
import 'package:QRhelp/profile.dart';
import 'package:QRhelp/scannedreg.dart';
import 'package:QRhelp/scannedunreg.dart';
import 'package:QRhelp/signup.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:QRhelp/userservices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      'homenav': (context) => homenav(),
      'homeqr': (context) => homeqr(),
      'profile': (context) => profile(),
      'services': (context) => userservices(),
      'adminhome': (context) => adminhome(),
      'scanreg': (context) => scannedreg(),
      'scanunreg': (context) => scannedunreg(),
    });
  }
}
