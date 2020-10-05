import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(
                image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                fit: BoxFit.fill,
              ),
//                boxShadow: [
//                  BoxShadow(
//                    color: const Color(0x91000000),
//                    offset: Offset(3, 3),
//                    blurRadius: 6,
//                  ),
//                ],
            ),
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
                  text: 'Welcome, ',
                ),
                TextSpan(
                  text: 'User',
                  style: TextStyle(
                    fontFamily: 'NeueKabel',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          Text('Military College of Telecommunication\nEngineering',
              style: TextStyle(
                fontFamily: 'NeueKabel',
                fontSize: 24,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),

          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
            ),
            textAlign: TextAlign.left,
          ),
          // InkWell(
          //     onTap: () => {login()},
          //     child: Text(
          //       'Forgot Password?',
          //       style: TextStyle(
          //         fontFamily: 'Segoe UI',
          //         fontSize: 21,
          //         color: const Color(0xa1090909),
          //       ),
          //       textAlign: TextAlign.left,
          //     )),

          Row(
            children: [
              SizedBox(
                width: 5.0,
              ),
              Container(
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
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
              SizedBox(
                width: 50.0,
              ),
              Container(
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 29,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
