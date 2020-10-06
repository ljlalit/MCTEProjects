import 'package:flutter/material.dart';

// ignore: camel_case_types
class adminhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'NeueKabelW01-Regular',
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
                    fontFamily: 'NeueKabelW01-Bold',
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          Container(
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
          SizedBox(
            width: 71.0,
            child: Text(
              'Scan',
              style: TextStyle(
                fontFamily: 'NeueKabelW01-Regular',
                fontSize: 29,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
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
        ],
      ),
    );
  }
}
