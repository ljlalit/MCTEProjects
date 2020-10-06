import 'package:QRhelp/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homeqr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe53935),
        body: Column(children: <Widget>[
          InkWell(
            onTap: () => (Navigator.pushNamed(context, 'home')),
            // Adobe XD layer: '76d5dbd2-d96c-4435-…' (shape)
            child: Container(
              width: 86.0,
              height: 86.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/76d5dbd2-d96c-4435-92dc-68cb226fd7a5.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: 311.0,
            height: 311.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xcc000000),
                  offset: Offset(8, 7),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 206.0,
            child: Text(
              'Your QR',
              style: TextStyle(
                fontFamily: 'NeueKabelW01-Bold',
                fontSize: 48,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}
