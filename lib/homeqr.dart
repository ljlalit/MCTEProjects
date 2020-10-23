import 'package:QRhelp/home.dart';
import 'package:flutter/material.dart';
import 'QrGenerator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

// ignore: camel_case_types
class homeqr extends StatefulWidget {
  @override
  _homeqrState createState() => _homeqrState();
}

class _homeqrState extends State<homeqr> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;
  User loggedinUser;
  String myuid;
  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        setState(() {
          this.myuid = loggedinUser.uid;
        });
        // myuid = loggedinUser.uid;
        print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe53935),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                InkWell(
                  onTap: () => (Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.topToBottom, child: home()),
                  )),
                  // Adobe XD layer: '76d5dbd2-d96c-4435-…' (shape)
                  child: Container(
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
//            Container(
//              width: 311.0,
//              height: 311.0,
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: const AssetImage(''),
//                  fit: BoxFit.fill,
//                ),
//                boxShadow: [
//                  BoxShadow(
//                    color: const Color(0xcc000000),
//                    offset: Offset(8, 7),
//                    blurRadius: 3,
                SizedBox(
                  width: 206.0,
                  child: Text(
                    'Your QR',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 48,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: QrGenerator(
                    userId: myuid,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ]),
        ));
  }
}
