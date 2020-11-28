import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:QRhelp/RedButton.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

//   var getOptions = {
//     source: 'cache'
// };
  var data;
  String name = 'loading';
  String number = 'loading';
  String rank = 'loading';
  String unit = 'loading';
  var docref;
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
              this.number = data['Number'];
              this.rank = data['Rank'];
              this.unit = data['Unit'];
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
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 198.0,
                height: 198.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Name: ${name}',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Rank:  ${rank}',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Number:  ${number}',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Unit: ${unit}',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 34,
              color: const Color(0xff090909),
            ),
            textAlign: TextAlign.left,
          ),
          RedButton(
              text: 'Back',
              c: Colors.redAccent,
              height: 20.0,
              width: 150.0,
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
