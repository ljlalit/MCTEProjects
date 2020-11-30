import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'adminhome.dart';
import 'package:flutter/scheduler.dart';
import 'package:QRhelp/profile.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void logout(var context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
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
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
          body: FutureBuilder(
        future: getCurrentUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            // setState(() {
            //   showSpinner = true;
            // });
            return Container();
            //return Container(child: Center(child: Text("Loading...")));
          } else {
            if (snapshot.data.type == "admin") {
              // Future.delayed(Duration.zero, () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => adminhome(
                              service: snapshot.data.services[0].toString(),
                            )),
                    (route) => false);
              });
              // setState(() {
              //   showSpinner = false;
              // });
              // });
              return Container();
            } else
              // setState(() {
              //   showSpinner = false;
              // });
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
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              profile(userData: snapshot.data)))
                                },
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
                                onTap: () => ({
                                  // print('services button clicked.'),
                                  Navigator.pushNamed(context, 'services'),
                                }),
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
                                onTap: () =>
                                    ({Navigator.pushNamed(context, 'info')}),
                                title: Text(
                                  'Information',
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
                                    image: const AssetImage(
                                        'assets/Signals (1).png'),
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
                                      fontFamily: 'Bowlby',
                                      letterSpacing: 1.5,
                                      color: Colors.redAccent,
                                      fontSize: 50.0,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(),
                            InkWell(
                              onTap: () => ({
                                Navigator.pushNamedAndRemoveUntil(context,
                                    'homeqr', (Route<dynamic> route) => false),
                              }),
                              child: Container(
                                width: MediaQuery.of(context)
                                    .copyWith()
                                    .size
                                    .width,
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
                                              'assets/baseline_keyboard_arrow_up_white_48dp.png'),
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
      )),
    );
  }
}

// class Userdata {
//   String email;
//   String name;
//   String number;
//   String rank;
//   String type;
//   String unit;
//   var services = [];
//   Userdata(this.email, this.name, this.number, this.rank, this.services,
//       this.type, this.unit);
// }
