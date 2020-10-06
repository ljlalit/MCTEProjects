import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class adminhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
                  text: 'Admin',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          Image(
            image: AssetImage('assets/Signals (1).png'),
          ),
          RedButton(
            text: 'Scan',
            width: 200.0,
            height: 20.0,
            onPressed: () {},
            c: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
