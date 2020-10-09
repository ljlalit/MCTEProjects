import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types

// ignore: camel_case_types
class firstadmin extends StatefulWidget {
  @override
  _firstadminState createState() => _firstadminState();
}

// ignore: camel_case_types
class _firstadminState extends State<firstadmin> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String cpass;
  String dropdownValue;

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
            height: 2.0,
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              cpass = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              labelText: 'Admin Key',
            ),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 2.0,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            hint: Text('Services'),
            style: TextStyle(color: Colors.black),
            underline: Container(height: 2, color: Colors.redAccent),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              'Swimming Pool',
              'Movie Hall',
              'DSOI',
              'Sports Centre'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
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
                print("Password fields dont match!");
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
                  }
                  if (newUser != null) {
                    Navigator.pushNamed(context, 'adminhome');
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
            width: 400.0,
            height: 55.0,
          ),
          RedButton(
            text: 'Sign Up as User',
            c: Colors.redAccent,
            onPressed: () {
              Navigator.pushNamed(context, 'signup');
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
