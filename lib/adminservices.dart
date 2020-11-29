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

  void getServiceUsers() async{
    servicesdocref =
        _firestore.collection("servicelist").doc(arr[0].toString());
    servicesdocref.get().then((value) {
      if (value.exists) {
        servicesdata = value.data();
        asd = servicesdata;
        var s1 = [];
        var s2 = [];
        asd.forEach((key, value) {
          s2.add(key);
          s1.add(value["Name"]);
        });
        setState(() {
          this.servicesarr = List.from(s1);
          this.servicesarr2 = List.from(s2);
          this.servicesarrlen = servicesarr.length;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: new Text('Users registered'),
          backgroundColor: Colors.red,
        ),
        body: new ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  height: 70,
                  color: Colors.white,
                  child: Center(
                    child: Row(children: <Widget>[
                      Text(
                        '${servicesarr[index]}',
                        style: TextStyle(color: Colors.black),
                      ),
                      RedButton(
                          text: 'Unregister',
                          c: Colors.redAccent,
                          height: 20.0,
                          width: 150.0,
                          onPressed: () {
                            print("pressed");
                            try{
                            _firestore
                                .collection('servicelist')
                                .doc(arr[0])
                                .update(
                                    {servicesarr2[index]: FieldValue.delete()});
                            } catch(e){
                              print(e);
                            }
                            targetuserdocref = _firestore
                                .collection("users")
                                .doc(servicesarr2[index]);
                            targetuserdocref.get().then((value) {
                              if (value.exists) {
                                targetuserdata = value.data();

                                this.targetuserservices =
                                    targetuserdata["Services"];
                                targetuserservices.remove(arr[0].toString());
                                try {
                                  _firestore
                                      .collection('users')
                                      .doc(servicesarr2[index])
                                      .update(
                                    {
                                      'Services': targetuserservices,
                                    },
                                  );
                                } catch (e) {
                                  print(e);
                                }
                              }
                            }).catchError((e) {
                              print(e);
                            });
                            getServiceUsers();
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => adminhome(
                            //               service: arr[0].toString(),
                            //             )),
                            //     (route) => false);
                          }),
                    ]),
                  )),
            );
          },
          itemCount: servicesarrlen,
        ));
  }
}
