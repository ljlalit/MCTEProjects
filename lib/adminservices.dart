import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

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
  var arr = [];
  var servicesdata;
  var servicesdocref;
  int servicesarrlen = 0;
  var servicesarr = [];
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
              this.arr = data['Services'];
              this.arrlen = this.arr.length;
              getServiceUsers();
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

  void getServiceUsers() {
    servicesdocref = _firestore.collection("services").doc(arr[0]);
    servicesdocref.get().then((value) {
      if (value.exists) {
        servicesdata = value.data();
        setState(() {
          this.servicesarr = servicesdata;
          this.servicesarrlen = this.servicesarr.length;
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'All Services',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 40,
                    color: const Color(0xff090909),
                  ),
                  textAlign: TextAlign.left,
                ),
              ]),
          for (int i = 0; i < arrlen; i++)
            Text(
              '${arr[i]['Name'].toString()}',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 34,
                color: const Color(0xff090909),
              ),
              textAlign: TextAlign.left,
            ),

          //Jo bhi changes krne ho krdiyo
          //services daaliyo font size 34 tho
        ],
      ),
    );
  }
}
