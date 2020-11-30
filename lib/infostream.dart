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

  infostream({Key key, this.serviceN}) : super(key: key);
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
    getDescription();
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

  Future<String> getDescription() async {
    docref =
        _firestore.collection('servicedescription').doc(serviceName.toString());
    data = await docref.get();
    String desc = data["description"];
    return desc;
  }

  String description = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: FutureBuilder(
                future: getDescription(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (!snapshot.hasData)
                    return Container();
                  else
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                            child: Container(
                          width: 270,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 24,
                            initialValue: snapshot.data.toString(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 7.0, color: Colors.redAccent),
                              ),
                              labelText: '$serviceName description',
                            ),
                            onChanged: (value) {
                              description = value;
                            },
                          ),
                        )),
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
                                  ).then((value) {
                                    Alert(
                                      context: context,
                                      style: alertStyle,
                                      type: AlertType.info,
                                      title: "Update",
                                      desc: "Successfully Updated!!!",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          color:
                                              Color.fromRGBO(0, 179, 134, 1.0),
                                          radius: BorderRadius.circular(0.0),
                                        ),
                                      ],
                                    ).show();
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              }),
                        ),
                        SizedBox(),
                      ],
                    );
                })));
  }
}
