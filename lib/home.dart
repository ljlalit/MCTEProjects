import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  final _auth = FirebaseAuth.instance;
  User loggedinUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(children: <Widget>[
          Row(children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'homenav');
                  },

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
            Container(
              width: 47.0,
              height: 36.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
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
          ]),
          Text.rich(
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
          InkWell(
            onTap: () => ({Navigator.pushNamed(context, 'homeqr')}),
            child: Transform.rotate(
              angle: -0.5411,
              child: Container(
                width: 676.0,
                height: 426.0,
                decoration: BoxDecoration(
                  color: const Color(0xffe53935),
                ),
                child: Column(
                  children: <Widget>[
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
                    Container(
                      alignment: Alignment.center,
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
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
