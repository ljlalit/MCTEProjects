import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'buildTextField.dart';

// ignore: camel_case_types
class firstsign extends StatefulWidget {
  @override
  _firstsignState createState() => _firstsignState();
}

class _firstsignState extends State<firstsign> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;
  String name;
  String number;
  String rank;
  String unit;
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
              child: BuildTextField(
                kType: TextInputType.name,
                otext: false,
                ltext: 'Name',
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            Expanded(
              child: BuildTextField(
                kType: TextInputType.number,
                otext: false,
                ltext: 'Number',
                onChanged: (value) {
                  number = value;
                },
              ),
            ),
            Expanded(
              child: BuildTextField(
                kType: TextInputType.name,
                otext: false,
                ltext: 'Rank',
                onChanged: (value) {
                  rank = value;
                },
              ),
            ),
            Expanded(
              child: BuildTextField(
                kType: TextInputType.name,
                otext: false,
                ltext: 'Unit',
                onChanged: (value) {
                  unit = value;
                },
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
                      'Name': name,
                      'Number': number,
                      'Rank': rank,
                      'Unit': unit,
                      'Email': loggedinUser.email,
                      'Services': [],
                      'Type': 'guser',
                    });
                    if (loggedinUser != null) {
                      if (!loggedinUser.emailVerified) {
                        print(loggedinUser.emailVerified);
                        await _auth.signOut();
                        // Navigator.pushNamed(context, 'login');
                        Alert(
                          context: context,
                          style: alertStyle,
                          type: AlertType.info,
                          title: "Verification email sent",
                          desc: "Verify and Login to proceed",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'login'),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                              radius: BorderRadius.circular(0.0),
                            ),
                          ],
                        ).show();
                      } else {
                        Navigator.pushNamed(context, 'home');
                      }
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
