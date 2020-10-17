import 'package:QRhelp/homenav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  User loggedinUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  String name = 'loading';
  String type;
  var docref;
  var data;

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        docref = _firestore.collection("users").doc(loggedinUser.uid);
        docref.get().then((value) {
          if (value.exists) {
            data = value.data();
            setState(() {
              this.name = data['Name'];
              this.type = data['Type'];
              if (type == 'admin') {
                Navigator.pushNamed(context, 'adminhome');
              }
            });
          }
        }).catchError((e) {
          print(e);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffffffff),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(),
                        Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: homenav()));
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
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        Container(
                            width: 70.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(0xffe53935),
                              borderRadius: BorderRadius.circular(3.0),
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/ADGPI_Indian_Army.svg.png'),
                                fit: BoxFit.fill,
                              ),
                            )),
                        SizedBox(),
                      ]),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'NeueKabel',
                        fontSize: 48,
                        color: const Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text: 'Hello, ',
                        ),
                        TextSpan(
                          text: '${name}',
                          style: TextStyle(
                            fontFamily: 'NeueKabel',
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(),
                  InkWell(
                    onTap: () => ({
                      Navigator.pushNamed(
                        context,
                        'homeqr',
                      ),
                    }),
                    child: Container(
                      width: MediaQuery.of(context).copyWith().size.width,
                      height:
                          MediaQuery.of(context).copyWith().size.height / 3.5,
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
                                fontFamily: 'NeueKabel',
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
                ])));
  }
}
