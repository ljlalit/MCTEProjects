import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'buildTextField.dart';

// ignore: camel_case_types
class infostream extends StatefulWidget {
  final String serviceN;

  infostream ({ Key key, this.serviceN }): super(key: key);
  @override
  _infostreamState createState() => _infostreamState();
}

class _infostreamState extends State<infostream> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedinUser;
  var docref;
  var data;
  String serviceName;
  void initState() {
    super.initState();
    serviceName = widget.serviceN;
    // getCurrentUser();
  }

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
              serviceName = data["Services"][0];
            });
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  String description;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: BuildTextField(
                kType: TextInputType.name,
                otext: false,
                ltext: '${serviceName} description',
                onChanged: (value) {
                  description = value;
                },
              ),
            ),
            Center(
              child: RedButton(
                  text: 'Update',
                  c: Colors.blueAccent,
                  onPressed: () {
                    try {
                      _firestore
                          .collection('servicedescription')
                          .doc(serviceName.toString())
                          .update(
                        {
                          'description': description,
                        },
                      );
                    } catch (e) {
                      print(e);
                      print('dfddff\nzsfx');
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
