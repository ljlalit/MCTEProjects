import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';

// ignore: camel_case_types

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _auth = FirebaseAuth.instance;
  String email;

  String password;

  String cpass;

  @override
  Widget build(BuildContext context) {
    RedButton b1 = RedButton(
      text: 'Continue',
      onPressed: () async{
        try{
          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          if(newUser != null){
            Navigator.pushNamed(context, 'firstsignin');
          }
        } 
        catch(e){
          print(e);
        }
      },
    );
    RedButton b2 = RedButton(
      text: 'Login',
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
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
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value){
              email = value;
            },
            decoration: InputDecoration(labelText: 'Email'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            // obscureText: true,
            onChanged: (value){
              password = value;
            },
            decoration: InputDecoration(labelText: 'Password'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            onChanged: (value){
              cpass = value;
            },
            decoration: InputDecoration(labelText: 'Confirm Password'),
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
          Row(
            children: [
              SizedBox(
                width: 5.0,
              ),
              b1.buildButton(),
              SizedBox(
                width: 50.0,
              ),
              b2.buildButton(),
            ],
          ),
        ],
      ),
    );
  }
}
