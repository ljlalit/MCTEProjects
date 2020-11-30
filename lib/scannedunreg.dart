import 'dart:async';
import 'dart:collection';
import 'package:QRhelp/adminhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:QRhelp/RedButton.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class scannedunreg extends StatefulWidget {
  final String targetuserid;
  scannedunreg({this.targetuserid});

  @override
  _scannedunregState createState() => _scannedunregState();
}

class _scannedunregState extends State<scannedunreg> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String id;
  User loggedinUser;
  var servicedocref;
  var servicedata;
  var targetuserdocref;
  var targetuserdata;
  var targetusername;
  var targetuseremail;
  var targetuserservices;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    id = widget.targetuserid;
  }

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        servicedocref = _firestore.collection("users").doc(loggedinUser.uid);
        servicedocref.get().then((value) {
          if (value.exists) {
            servicedata = value.data();
            //print(servicedata["Services"]);
            getTargetUser();
          }
        }).catchError((e) {
          print(e);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void getTargetUser() {
    targetuserdocref = _firestore.collection("users").doc(id);
    targetuserdocref.get().then((value) {
      if (value.exists) {
        targetuserdata = value.data();
        setState(() {
          this.targetusername = targetuserdata["Name"];
          this.targetuseremail = targetuserdata["Email"];
          this.targetuserservices = targetuserdata["Services"];
          //print(targetuserservices);
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              width: 60.0,
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                image: DecorationImage(
                  image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Service Unregistered.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 32,
                color: const Color(0xff090909),
              ),
              textAlign: TextAlign.left,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            SizedBox(
              width: 15.0,
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
                    text: '${targetusername} \n',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                    ),
                  ),
                  TextSpan(
                    text: 'Account',
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ]),
          Container(
            width: 357.0,
            height: 357.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/Signals (1).png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                RedButton(
                    c: Colors.lightBlueAccent,
                    text: 'Scan again',
                    height: 20.0,
                    width: 150.0,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                RedButton(
                    text: 'Register',
                    c: Colors.redAccent,
                    height: 20.0,
                    width: 150.0,
                    onPressed: () async {
                      try {
                        _firestore
                            .collection('servicelist')
                            .doc(servicedata["Services"][0])
                            .update({
                          id: {
                            'Name': targetusername,
                            'Email': targetuseremail,
                          }
                        });
                      } catch (e) {
                        print(e);
                      }
                      targetuserservices.add(servicedata["Services"][0]);
                      //print(targetuserservices);
                      try {
                        _firestore.collection('users').doc(id).update(
                          {
                            'Services': targetuserservices,
                          },
                        );
                      } catch (e) {
                        print(e);
                      }
                      Navigator.pushReplacementNamed(context, 'home');
                    }),
                SizedBox(
                  width: 10.0,
                ),
              ])
        ],
      ),
    );
  }
}
