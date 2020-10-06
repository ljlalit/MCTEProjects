import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';
import 'constants.dart';

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
          Text(
            'Military College of Telecommunication\nEngineering',
            style: TextStyle(
              fontFamily: 'NeueKabel',
              fontSize: 24,
              color: const Color(0xff000000),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.left,
            onChanged: (value) {
              email = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              labelText: 'Email',
            ),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              labelText: 'Password',
            ),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              cpass = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              labelText: 'Confirm Password',
            ),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          SizedBox(
            height: 100.0,
          ),
          RedButton(
            text: 'Continue',
            c: Colors.redAccent,
            onPressed: () async {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Navigator.pushNamed(context, 'firstsignin');
                }
              } catch (e) {
                print(e);
              }
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
              Navigator.pushNamed(context, 'login');
            },
            width: 200.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
