import 'package:flutter/material.dart';

// ignore: camel_case_types
class scannedunreg extends StatelessWidget {
  final targetuserdata;
  final servicedata;
  scannedunreg({this.targetuserdata, this.servicedata});
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
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Service Unregistered.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 32,
                color: const Color(0xff090909),
              ),
              textAlign: TextAlign.left,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            SizedBox(
              width: 15.0,
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NeueKabel',
                  fontSize: 48,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: 'Username\'s \n',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                    ),
                  ),
                  TextSpan(
                    text: 'Account',
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ]),
          Container(
            width: 357.0,
            height: 357.0,
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
                SizedBox(
                  width: 10.0,
                ),
                FlatButton(
                  color: const Color(0xffe53935),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 29,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                FlatButton(
                  color: const Color(0xffe53935),
                  onPressed: () {
                    Navigator.pushNamed(context, 'scanreg');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 29,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ])
        ],
      ),
    );
  }
}
