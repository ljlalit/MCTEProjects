import 'package:flutter/material.dart';

// ignore: camel_case_types
class firstsign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffe53935),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Hero(
                tag: 'logo',
                child: Container(
                  width: 243.0,
                  height: 185.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(labelText: 'Name'),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(labelText: 'Number'),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(labelText: 'Rank'),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(labelText: 'Unit'),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
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
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 29,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
