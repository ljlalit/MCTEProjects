import 'package:QRhelp/scannedreg.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';

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
              RedButton(
                text: 'Scan',
                width: 150.0,
                height: 20.0,
                c: Colors.redAccent,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'qrscanner',
                  );
                },
              ),
              RedButton(
                text: 'Show All',
                width: 150.0,
                height: 20.0,
                c: Colors.redAccent,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'adminservices',
                  );
                },
              ),
              RedButton(
                text: 'Logout',
                width: 100.0,
                height: 20.0,
                c: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'login',
                  );
                },
              ),
              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
