import 'package:QRhelp/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homeqr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe53935),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(52.0, 369.0),
            child: Container(
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
          ),
          Transform.translate(
            offset: Offset(103.8, 160.0),
            child: SizedBox(
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
          ),
          Transform.translate(
            offset: Offset(-121.8, -88.6),
            child: Transform.rotate(
              angle: -0.5411,
              child: Container(
                width: 348.0,
                height: 178.0,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(164.0, 655.0),
              child: Transform.rotate(
                angle: 3.1416,
                child: InkWell(
                  onTap: () => (home()),
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
              )),
        ],
      ),
    );
  }
}
