import 'package:QRhelp/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class firstsign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 414.0,
            height: 896.0,
            decoration: BoxDecoration(
              color: const Color(0xffe53935),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xa6000000),
                  offset: Offset(2, 5),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(58.0, 408.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Username'),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(58.0, 493.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Password'),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(58.0, 578.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Confirm Password'),
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(142.0, 756.0),
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
              offset: Offset(139.8, 764.0),
              child: InkWell(
                onTap: () => ({home()}),
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
              )),
          Transform.translate(
            offset: Offset(86.0, 121.0),
            child:
                // Adobe XD layer: 'ADGPI_Indian_Army.s…' (shape)
                Container(
              width: 243.0,
              height: 185.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x91000000),
                    offset: Offset(0, 7),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
