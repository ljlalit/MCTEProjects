import 'package:flutter/material.dart';

// ignore: camel_case_types
class userservices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Your Services',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 40,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),

          //services daaliyo font size 34 tho
        ],
      ),
    );
  }
}
