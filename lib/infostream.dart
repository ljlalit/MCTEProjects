import 'package:QRhelp/RedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'buildTextField.dart';

// ignore: camel_case_types
class infostream extends StatelessWidget {
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
                ltext: 'Name',
                onChanged: (value) {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RedButton(
                    text: 'Update', c: Colors.blueAccent, onPressed: () {}),
                RedButton(
                  text: 'Back',
                  c: Colors.blueAccent,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
