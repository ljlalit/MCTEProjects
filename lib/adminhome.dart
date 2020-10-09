import 'package:QRhelp/scannedreg.dart';
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              width: 60.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ]),
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
          Container(
            width: 340.0,
            height: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/Signals (1).png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'qrscanner');
                },
                color: const Color(0xffe53935),
                child: Text(
                  'Scan',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                    fontSize: 29,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              FlatButton(
                color: const Color(0xffe53935),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                    fontSize: 29,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              FlatButton(
                color: const Color(0xffe53935),
                onPressed: () {
                  Navigator.pushNamed(context, 'adminservices');
                },
                child: Text(
                  'Show All',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                    fontSize: 29,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
