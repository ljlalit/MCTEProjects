import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void logout(var context) async {
    await _auth.signOut();
    Navigator.pushNamed(context, 'login');
  }

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
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.redAccent,
              ),
              child: Drawer(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: SizedBox(),
                    ),
                    ListTile(
                      onTap: () => {Navigator.pushNamed(context, 'profile')},
                      title: Text(
                        'Your Profile',
                        style: TextStyle(
                          fontFamily: 'NeueKabel',
                          fontSize: 32,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () => ({Navigator.pushNamed(context, 'services')}),
                      title: Text(
                        'Your Services',
                        style: TextStyle(
                          fontFamily: 'NeueKabel',
                          fontSize: 32,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(),
                    ListTile(
                        onTap: () => ({logout(context)}),
                        title: SizedBox(
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
                    ListTile(
                      title: SizedBox(),
                    ),
                    ListTile(
                        title: Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/Signals (1).png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 0.1,
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
                      height: 180.0,
                      // MediaQuery.of(context).copyWith().size.height / 3.5,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 86.0,
                            height: 86.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/baseline_keyboard_arrow_up_black_18dp.png'),
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
