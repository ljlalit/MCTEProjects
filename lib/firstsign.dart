import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class firstsign extends StatefulWidget {
  @override
  _firstsignState createState() => _firstsignState();
}

class _firstsignState extends State<firstsign> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;
  String name;
  String number;
  String rank;
  String unit;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffe53935),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Hero(
                tag: 'logo',
                child: Container(
                  width: 243.0,
                  height: 185.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                onChanged: (value) {
                  number = value;
                },
                decoration: InputDecoration(labelText: 'Number'),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                onChanged: (value) {
                  rank = value;
                },
                decoration: InputDecoration(labelText: 'Rank'),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                onChanged: (value) {
                  unit = value;
                },
                decoration: InputDecoration(labelText: 'Unit'),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xffe53935),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xc4000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () async {
                    try {
                      _firestore.collection('users').doc(loggedinUser.uid).set({
                        'Name': name,
                        'Number': number,
                        'Rank': rank,
                        'Unit': unit,
                        'Services': [],
                      });
                      if (loggedinUser != null) {
                        Navigator.pushNamed(context, 'home');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'NeueKabel',
                      fontSize: 29,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
