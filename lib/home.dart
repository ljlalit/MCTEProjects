import 'package:QRhelp/homenav.dart';
import 'package:QRhelp/homeqr.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(26.0, 225.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NeueKabelW01-Regular',
                  fontSize: 48,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: 'Hello, ',
                  ),
                  TextSpan(
                    text: 'UserName',
                    style: TextStyle(
                      fontFamily: 'NeueKabelW01-Bold',
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(333.0, 112.0),
            child:
                // Adobe XD layer: 'ADGPI_Indian_Army.s…' (shape)
                Container(
              width: 47.0,
              height: 36.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x91000000),
                    offset: Offset(3, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(-91.6, 575.6),
              child: InkWell(
                onTap: () => ({homeqr()}),
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
              )),
          Transform.translate(
            offset: Offset(121.0, 729.0),
            child: Text(
              'Your QR',
              style: TextStyle(
                fontFamily: 'NeueKabelW01-Bold',
                fontSize: 48,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 96.0),
            child: InkWell(
                onTap: () => ({homenav()}),
                // Adobe XD layer: 'baseline_account_ci…' (shape)
                child: Container(
                  width: 68.0,
                  height: 68.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/baseline_account_circle_black_18dp.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
          ),
          Transform.translate(
            offset: Offset(164.0, 655.0),
            child: Transform.rotate(
              angle: 3.1416,
              child:
                  // Adobe XD layer: '76d5dbd2-d96c-4435-…' (shape)
                  Container(
                width: 86.0,
                height: 86.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        'assets/76d5dbd2-d96c-4435-92dc-68cb226fd7a5.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
