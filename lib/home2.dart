import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class home2 extends StatefulWidget {
  final String serviceN;

  home2 ({ Key key, this.serviceN }): super(key: key);

  @override
  _home2State createState() => _home2State();
}

class _home2State extends State<home2> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User loggedinUser;
  var docref;
  var data;
  String serviceName = '';
  @override
  void initState() {
    super.initState();
    serviceName = widget.serviceN;
    getCurrentUser();
  }

  void logout(var context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
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

  @override
  Widget build(BuildContext context) {
    //Rprint(serviceName);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
            Column(
              children: [
                FlatButton(
                  onPressed: () {
                    logout(context);
                  },
                  child: Icon(
                    FontAwesomeIcons.powerOff,
                    color: Colors.redAccent,
                    size: 35.0,
                  ),
                ),
                Text(
                  'Logout',
                ),
              ],
            ),
          ],
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
                text: 'Welcome,\n',
              ),
              TextSpan(
                text: ' ${serviceName} Admin',
                style: TextStyle(
                  fontFamily: 'NeueKabel',
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        Container(
          width: 340.0,
          height: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/Signals (1).png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
