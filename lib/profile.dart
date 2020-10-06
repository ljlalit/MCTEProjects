import 'package:flutter/material.dart';

// ignore: camel_case_types
class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 198.0,
            height: 198.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/baseline_account_circle_black_18dp.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          FlatButton(
            color: const Color(0xffe53935),
            child: Text(
              'Change Photo',
              style: TextStyle(
                fontFamily: 'NeueKabelW01-Regular',
                fontSize: 24,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {},
          ),
          Text(
            'Name:',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Rank:',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Number:',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Unit:',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
