import 'package:firebase_auth/firebase_auth.dart';
import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'buildTextField.dart';

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
                  if (user.user.emailVerified) {
                    Navigator.pushNamed(context, 'home');
                  } else {
                    _auth.signOut();
                    // Navigator.pushNamed(context, 'login');
                    Alert(
                      context: context,
                      style: alertStyle,
                      type: AlertType.error,
                      title: "Email not verified",
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
              } catch (e) {
                // print(e);
                Alert(
                  context: context,
                  style: alertStyle,
                  type: AlertType.error,
                  title: "Invalid Email/Password",
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

// class BuildTextField extends StatelessWidget {
//   final onChanged;
//   final String ltext;
//   final bool otext;
//   BuildTextField({this.ltext, this.onChanged,this.otext});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       // keyboardType: TextInputType.emailAddress,
//       obscureText: otext,
//       onChanged: onChanged,
//       decoration: kTextFieldDecoration.copyWith(
//         labelText: ltext,
//       ),
//       style: TextStyle(
//         fontFamily: 'Segoe UI',
//         fontSize: 24,
//       ),
//       textAlign: TextAlign.left,
//     );
//   }
// }
