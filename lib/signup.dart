import 'package:QRhelp/firstadmin.dart';
import 'package:QRhelp/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'buildTextField.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types

// ignore: camel_case_types
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String cpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              width: 80.0,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'NeueKabel',
                fontSize: 48,
                color: const Color(0xff000000),
              ),
              children: [
                TextSpan(
                  text: 'Hello, ',
                ),
                TextSpan(
                  text: 'User',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          TypewriterAnimatedTextKit(
            text: [
              'Military College of Telecommunication\nEngineering',
            ],
            textStyle: TextStyle(
              fontFamily: 'NeueKabel',
              fontSize: 24,
              color: const Color(0xff000000),
            ),
            textAlign: TextAlign.center,
            displayFullTextOnTap: true,
            totalRepeatCount: 2,
            speed: Duration(milliseconds: 200),
          ),
          SizedBox(
            height: 2.0,
          ),
          BuildTextField(
            kType: TextInputType.emailAddress,
            otext: false,
            ltext: 'Email',
            onChanged: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          BuildTextField(
            kType: TextInputType.visiblePassword,
            otext: true,
            ltext: 'Password',
            onChanged: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          BuildTextField(
            kType: TextInputType.visiblePassword,
            otext: true,
            ltext: 'Confirm Password',
            onChanged: (value) {
              cpass = value;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          // SizedBox(
          //   height: 100.0,
          // ),
          RedButton(
            text: 'Continue',
            c: Colors.redAccent,
            onPressed: () async {
              if (password != cpass) {
                // print("Password fields dont match!");
                Alert(
                  context: context,
                  style: alertStyle,
                  type: AlertType.error,
                  title: "Password fields do not match!",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                      radius: BorderRadius.circular(0.0),
                    ),
                  ],
                ).show();
              } else {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email.trim(), password: password);
                  try {
                    await newUser.user.sendEmailVerification();
                  } catch (e) {
                    print(
                        "An error occured while trying to send email verification");
                    print(e.message);
                    Alert(
                      context: context,
                      style: alertStyle,
                      type: AlertType.error,
                      title:
                          "An error occured while trying to send email verification",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                          radius: BorderRadius.circular(0.0),
                        ),
                      ],
                    ).show();
                  }
                  if (newUser != null) {
                    Navigator.pushNamed(context, 'firstsign');
                  }
                } catch (e) {
                  // print(e);
                  Alert(
                    context: context,
                    style: alertStyle,
                    type: AlertType.error,
                    title: "Invalid Email or user already exist",
                    desc: "Enter correct Email",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                        radius: BorderRadius.circular(0.0),
                      ),
                    ],
                  ).show();
                }
              }
            },
            width: 400.0,
            height: 55.0,
          ),
          RedButton(
            text: 'Sign Up as Admin',
            c: Colors.redAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: firstadmin()));
            },
            width: 400.0,
            height: 55.0,
          ),
          SizedBox(
            width: 50.0,
          ),
          RedButton(
            text: 'Login',
            c: Colors.blueAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight, child: login()));
            },
            width: 200.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
