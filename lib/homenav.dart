import 'package:QRhelp/login.dart';
import 'package:QRhelp/profile.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homenav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-91.6, 575.6),
            child: Transform.rotate(
              angle: -0.5411,
              child: Container(
                width: 676.0,
                height: 426.0,
                decoration: BoxDecoration(
                  color: const Color(0xffe53935),
                ),
              ),
            ),
          ),
          Container(
            width: 316.0,
            height: 896.0,
            decoration: BoxDecoration(
              color: const Color(0xffe53935),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xab000000),
                  offset: Offset(0, 6),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(119.0, 118.0),
            child: Container(
              width: 88.0,
              height: 88.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(64.0, 240.0),
              child: SizedBox(
                width: 192.0,
                child: InkWell(
                  onTap: () => ({profile()}),
                  child: Text(
                    'Your Profile',
                    style: TextStyle(
                      fontFamily: 'NeueKabelW01-Bold',
                      fontSize: 32,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Transform.translate(
            offset: Offset(99.2, 388.0),
            child: InkWell(
                onTap: () => ({login()}),
                child: SizedBox(
                  width: 118.0,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'NeueKabelW01-Bold',
                      fontSize: 32,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Transform.translate(
            offset: Offset(119.0, 118.0),
            child:
                // Adobe XD layer: 'baseline_account_ci…' (shape)
                Container(
              width: 88.0,
              height: 88.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/baseline_account_circle_black_18dp.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-23.0, 462.0),
            child:
                // Adobe XD layer: 'Signals (1)' (shape)
                Container(
              width: 357.0,
              height: 357.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(240.0, 93.0),
            child:
                // Adobe XD layer: 'clear_white_192x192' (shape)
                Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
