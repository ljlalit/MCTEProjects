import 'dart:collection';
import 'package:QRhelp/RedButton.dart';
import 'package:QRhelp/adminhome.dart';
import 'package:QRhelp/userservices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class adminservices extends StatefulWidget {
  @override
  _adminservicesState createState() => _adminservicesState();
}

class _adminservicesState extends State<adminservices> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  var data;
  var docref;
  int arrlen = 0;
  var arr;
  var servicesdata;
  var servicesdocref;
  int servicesarrlen = 0;
  var servicesarr = [];
  var servicesarr2 = [];
  var targetuserdocref;
  var targetuserdata;
  var targetusername;
  var targetuseremail;
  List<dynamic> targetuserservices;
  LinkedHashMap asd;
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
            this.arr = data['Services'];
            this.arrlen = this.arr.length;
            getServiceUsers();
          }
        }).catchError((e) {
          print(e);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void getServiceUsers() {
    servicesdocref =
        _firestore.collection("servicelist").doc(arr[0].toString());
    servicesdocref.get().then((value) {
      if (value.exists) {
        servicesdata = value.data();
        setState(() {
          this.asd = servicesdata;
          asd.forEach((key, value) {
            this.servicesarr2.clear();
            this.servicesarr.clear();
            this.servicesarr2.add(key);
            this.servicesarr.add(value["Name"]);
          });
          this.servicesarrlen = 0;
          this.servicesarrlen = servicesarr.length;
        });
      } else {
        this.servicesarrlen = 0;
        this.servicesarr2.clear();
        this.servicesarr.clear();
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
          // RedButton(
          //   text: 'Refresh',
          //   c: Colors.blueAccent,
          //   onPressed: () {},
          //   width: 200.0,
          //   height: 20.0,
          // ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Users registered',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 40,
                    color: const Color(0xff090909),
                  ),
                  textAlign: TextAlign.left,
                ),
              ]),
          //if (servicesarrlen != 0)
          for (int i = 0; i < servicesarrlen; i++)
            Row(
              children: [
                Text(
                  '${servicesarr[i]}',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 34,
                    color: const Color(0xff090909),
                  ),
                  textAlign: TextAlign.left,
                ),
                RedButton(
                    text: 'Unregister',
                    c: Colors.redAccent,
                    height: 20.0,
                    width: 150.0,
                    onPressed: () {
                      _firestore
                          .collection('servicelist')
                          .doc(arr[0])
                          .update({servicesarr2[i]: FieldValue.delete()});

                      targetuserdocref =
                          _firestore.collection("users").doc(servicesarr2[i]);
                      targetuserdocref.get().then((value) {
                        if (value.exists) {
                          targetuserdata = value.data();
                          setState(() {
                            this.targetuserservices =
                                targetuserdata["Services"];
                            targetuserservices.remove(arr[0].toString());
                            try {
                              _firestore
                                  .collection('users')
                                  .doc(servicesarr2[i])
                                  .update(
                                {
                                  'Services': targetuserservices,
                                },
                              );
                            } catch (e) {
                              print(e);
                            }
                          });
                        }
                      }).catchError((e) {
                        print(e);
                      });

                      print(servicesarr);
                      print(servicesarr2);
                      servicesdocref.get().then((value) {
                        print('Serviczdsxdsddafsfasfes');
                        if (value.exists) {
                          print('Servicafsfasfes');
                          servicesdata = value.data();
                          setState(() {
                            asd = servicesdata;
                            asd.forEach((key, value) {
                              servicesarr2.clear();
                              servicesarr.clear();
                              servicesarr2.add(key);
                              servicesarr.add(value["Name"]);
                            });
                            servicesarrlen = 0;
                            servicesarrlen = servicesarr.length;
                          });
                        } else {
                          print('Sasfes');
                          servicesarrlen = 0;
                          servicesarr2.clear();
                          servicesarr.clear();
                        }
                      }).catchError((e) {
                        print(e);
                      });
                    }),
              ],
            ),

          //Jo bhi changes krne ho krdiyo
          //services daaliyo font size 34 tho
        ],
      ),
    );
  }
}
