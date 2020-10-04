import 'package:QRhelp/firstsign.dart';
import 'package:QRhelp/login.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
              offset: Offset(30.0, 115.0),
              child: InkWell(
                  onTap: () => {login()},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 22,
                      color: const Color(0xff090909),
                    ),
                    textAlign: TextAlign.left,
                  ))),
          Transform.translate(
            offset: Offset(119.0, 115.0),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: const Color(0xff090909),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(333.0, 112.0),
            child:
                // Adobe XD layer: 'ADGPI_Indian_Army.s…' (shape)
                Container(
              width: 47.0,
              height: 36.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x91000000),
                    offset: Offset(3, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 377.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Name'),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 546.0),
            child: new TextField(
              decoration: InputDecoration(labelText: 'Number'),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
              offset: Offset(26.0, 732.0),
              child: InkWell(
                  onTap: () => {login()},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 21,
                      color: const Color(0xa1090909),
                    ),
                    textAlign: TextAlign.left,
                  ))),
          Transform.translate(
            offset: Offset(28.0, 462.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Rank'),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(28.0, 377.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Unit'),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(-5.4, 223.0),
            child: SizedBox(
              width: 269.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'NeueKabelW01-Regular',
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
                        fontFamily: 'NeueKabelW01-Bold',
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(17.0, 291.0),
            child: Text(
              'Military College of Telecommunication\nEngineering',
              style: TextStyle(
                fontFamily: 'NeueKabelW01-Regular',
                fontSize: 24,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(248.0, 768.0),
            child: Container(
              width: 132.0,
              height: 63.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffe53935),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xc4000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(246.8, 781.0),
            child: InkWell(
              onTap: () => ({firstsign()}),
              child: SizedBox(
                width: 134.0,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'NeueKabelW01-Regular',
                    fontSize: 29,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
