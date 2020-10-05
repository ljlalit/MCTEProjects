import 'package:QRhelp/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class firstsign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
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
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Number'),
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Rank'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Unit'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
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
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return home();
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
        ],
      ),
    );
  }
}
