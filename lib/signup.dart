import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';

// ignore: camel_case_types

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RedButton b1 = RedButton(
      text: 'Continue',
      onPressed: () {
        Navigator.pushNamed(context, 'firstsignin');
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
            decoration: InputDecoration(labelText: 'Email'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
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
                width: 140.0,
              ),
              b2.buildButton(),
            ],
          ),
        ],
      ),
    );
  }
}
