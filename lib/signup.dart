import 'package:QRhelp/firstsign.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: const Color(0xff090909),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            RaisedButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 20,
                    color: const Color(0xff090909),
                  ),
                  textAlign: TextAlign.left,
                )),
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
          ]),
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
          // InkWell(
          //     onTap: () => {login()},
          //     child: Text(
          //       'Forgot Password?',
          //       style: TextStyle(
          //         fontFamily: 'Segoe UI',
          //         fontSize: 21,
          //         color: const Color(0xa1090909),
          //       ),
          //       textAlign: TextAlign.left,
          //     )),
          SizedBox(
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
          Text(
            'Military College of Telecommunication\nEngineering',
            style: TextStyle(
              fontFamily: 'NeueKabelW01-Regular',
              fontSize: 24,
              color: const Color(0xff000000),
            ),
            textAlign: TextAlign.left,
          ),
          Container(
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
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return firstsign();
              }));
            },
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
        ],
      ),
    );
  }
}
