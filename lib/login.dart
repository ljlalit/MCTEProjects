import 'package:firebase_auth/firebase_auth.dart';
import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/constants.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final _auth = FirebaseAuth.instance;

  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
//    RedButton(
//        text: 'Continue',
//        onPressed: () {
//          Navigator.pushNamed(context, 'home');
//        });

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
//                boxShadow: [
//                  BoxShadow(
//                    color: const Color(0x91000000),
//                    offset: Offset(3, 3),
//                    blurRadius: 6,
//                  ),
//                ],
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
                  text: 'Welcome, ',
                ),
                TextSpan(
                  text: 'User',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
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
            textAlign: TextAlign.left,
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
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
          SizedBox(
            height: 100.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          RedButton(
            text: 'Continue',
            c: Colors.redAccent,
            onPressed: () async {
              try {
                final user = await _auth.signInWithEmailAndPassword(
                email: email.trim(), password: password);
                if (user != null) {
                  if(user.user.emailVerified){
                    Navigator.pushNamed(context, 'home');
                  }else{
                    _auth.signOut();
                    Navigator.pushNamed(context, 'login');
                  }
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
            text: 'SignUp',
            c: Colors.blueAccent,
            onPressed: () {
              Navigator.pushNamed(context, 'signup');
            },
            width: 200.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
