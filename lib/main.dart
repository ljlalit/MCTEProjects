import 'package:QRhelp/adminhome.dart';
import 'package:QRhelp/info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:QRhelp/adminservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:QRhelp/firstadmin.dart';
import 'package:QRhelp/firstsign.dart';
import 'package:QRhelp/home.dart';
import 'package:QRhelp/homeqr.dart';
import 'package:QRhelp/profile.dart';
import 'package:QRhelp/qrscanner.dart';
import 'package:QRhelp/scannedreg.dart';
import 'package:QRhelp/scannedunreg.dart';
import 'package:QRhelp/signup.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:QRhelp/userservices.dart';

import 'infostream.dart';

final _auth = FirebaseAuth.instance;
String initialroute;
void getCurrentUser() {
  final user = _auth.currentUser;
  if (user != null) {
    initialroute = 'home';
  } else {
    initialroute = 'login';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getCurrentUser();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: initialroute, routes: {
      'login': (context) => login(),
      'signup': (context) => signup(),
      'home': (context) => home(),
      'firstsign': (context) => firstsign(),
      'homeqr': (context) => homeqr(),
      'profile': (context) => profile(),
      'services': (context) => userservices(),
      'adminhome': (context) => adminhome(),
      'qrscanner': (context) => QRViewExample(),
      'firstadmin': (context) => firstadmin(),
      'adminservices': (context) => adminservices(),
      'infostream': (context) => infostream(),
      'info': (context) => Info(),
    });
  }
}
