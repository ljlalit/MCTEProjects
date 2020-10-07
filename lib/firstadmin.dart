import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

// ignore: camel_case_types
class firstadmin extends StatefulWidget {
  @override
  _firstadminState createState() => _firstadminState();
}

class _firstadminState extends State<firstadmin> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;
  String adminkey;
  String servicekey;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Hero(
                tag: 'logo',
                child: Container(
                  width: 243.0,
                  height: 185.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  adminkey = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Key',
                ),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  servicekey = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Service',
                ),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
            Expanded(
              child: RedButton(
                text: 'Continue',
                width: 400,
                height: 55,
                c: Colors.redAccent,
                onPressed: () async {
                  try {
                    _firestore.collection('users').doc(loggedinUser.uid).set({
                      //use karein

                      'Email': loggedinUser.email,
                      'Services': [],
                      'Type': 'guser',
                    });
                    if (loggedinUser != null) {
                      Navigator.pushNamed(context, 'adminhome');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
