import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
  }

  String name;
  String type;
  var docref;
  var data;

  Future<Userdata> getCurrentUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedinUser = user;
    }
    docref = _firestore.collection("users").doc(loggedinUser.uid);
    data = await docref.get();
    Userdata userdata = Userdata(data["Email"], data["Name"], data["Number"],
        data["Rank"], data["Services"], data["Type"], data["Unit"]);
    return userdata;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
      future: getCurrentUserData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(child: Center(child: Text("Loading...")));
        } else {
          if (snapshot.data.type == "admin") {
            Navigator.pushNamed(context, "adminhome");
          }
          return Container(
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
                            onTap: () =>
                                {Navigator.pushNamed(context, 'profile')},
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
                            onTap: () =>
                                ({Navigator.pushNamed(context, 'services')}),
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
                                image:
                                    const AssetImage('assets/Signals (1).png'),
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
                                text: snapshot.data.name,
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
      },
    ));
  }
}

class Userdata {
  String email;
  String name;
  String number;
  String rank;
  String type;
  String unit;
  var services = [];
  Userdata(this.email, this.name, this.number, this.rank, this.services,
      this.type, this.unit);
}
