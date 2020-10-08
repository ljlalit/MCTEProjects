import 'package:QRhelp/login.dart';
import 'package:QRhelp/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


// ignore: camel_case_types
class homenav extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  void logout(var context){
    _auth.signOut();
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        height: MediaQuery.of(context).copyWith().size.height,
        width: MediaQuery.of(context).copyWith().size.width / 1.2,
        decoration: BoxDecoration(
          color: const Color(0xffe53935),
          boxShadow: [
            BoxShadow(
              color: const Color(0xab000000),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () => {Navigator.pop(context)},
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/clear_white_192x192.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
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
            InkWell(
              onTap: () => {Navigator.pushNamed(context, 'profile')},
              child: Text(
                'Your Profile',
                style: TextStyle(
                  fontFamily: 'NeueKabel',
                  fontSize: 32,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () => ({Navigator.pushNamed(context, 'services')}),
              child: Text(
                'Your Services',
                style: TextStyle(
                  fontFamily: 'NeueKabel',
                  fontSize: 32,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
                onTap: () => ({logout(context)}),
                child: SizedBox(
                  width: 118.0,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 32,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/Signals (1).png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
