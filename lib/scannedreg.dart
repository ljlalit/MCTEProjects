import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:QRhelp/RedButton.dart';

// ignore: camel_case_types
class scannedreg extends StatefulWidget {
  final String targetuserid;
  scannedreg({this.targetuserid});
  @override
  _scannedregState createState() => _scannedregState();
}

class _scannedregState extends State<scannedreg> {
  final _firestore = FirebaseFirestore.instance;
  String id;
  var targetuserdocref;
  var targetuserdata;
  var targetusername;
  @override
  void initState() {
    super.initState();
    id = widget.targetuserid;
    getTargetUser();
  }

  void getTargetUser() {
    print(id.toString());
    targetuserdocref = _firestore.collection("users").doc(id);
    targetuserdocref.get().then((value) {
      if (value.exists) {
        targetuserdata = value.data();
        setState(() {
          this.targetusername = targetuserdata["Name"];
          print(targetusername);
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
              'Service Registered.',
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
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            // FlatButton(
            //   color: const Color(0xffe53935),
            //   onPressed: () {
            //     Navigator.pushNamed(context, 'adminhome');
            //   },
            //   child: Text(
            //     'Back',
            //     style: TextStyle(
            //       fontFamily: 'NeueKabel',
            //       fontSize: 29,
            //       color: const Color(0xffffffff),
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            RedButton(
                text: 'Back',
                c: Colors.redAccent,
                height: 20.0,
                width: 150.0,
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                }),
          ])
        ],
      ),
    );
  }
}
