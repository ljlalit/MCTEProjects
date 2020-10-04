import 'package:flutter/material.dart';

// ignore: camel_case_types
class scannedreg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(26.0, 226.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NeueKabelW01-Regular',
                  fontSize: 48,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: 'Username\'s \n',
                    style: TextStyle(
                      fontFamily: 'NeueKabelW01-Bold',
                    ),
                  ),
                  TextSpan(
                    text: 'Account',
                  ),
                ],
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
                  image: const AssetImage(''),
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
            offset: Offset(29.0, 170.0),
            child: Text(
              'Service Registered.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 32,
                color: const Color(0xff090909),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(246.0, 757.0),
            child: Container(
              width: 130.0,
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffe53935),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(275.8, 766.0),
            child: SizedBox(
              width: 71.0,
              child: Text(
                'Back',
                style: TextStyle(
                  fontFamily: 'NeueKabelW01-Regular',
                  fontSize: 29,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(29.0, 369.0),
            child:
                // Adobe XD layer: 'Signals (1)' (shape)
                Container(
              width: 357.0,
              height: 357.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
