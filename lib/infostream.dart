import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'buildTextField.dart';

// ignore: camel_case_types
class infostream extends StatefulWidget {
  final String service;
  infostream({this.service});
  @override
  _infostreamState createState() => _infostreamState();
}

class _infostreamState extends State<infostream> {
  final _firestore = FirebaseFirestore.instance;
  String serviceName;
  void initState() {
    super.initState();
    serviceName = widget.service;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RedButton(
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
                RedButton(
                  text: 'Back',
                  c: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
