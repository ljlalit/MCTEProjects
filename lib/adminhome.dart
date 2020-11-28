import 'package:QRhelp/infostream.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:QRhelp/RedButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class adminhome extends StatefulWidget {
  String service;
  adminhome({this.service});
  @override
  _adminhomeState createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  final _auth = FirebaseAuth.instance;

  void logout(var context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }

  String serviceName;
  @override
  void initState() {
    super.initState();
    serviceName = widget.service;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(
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
                      image:
                          const AssetImage('assets/ADGPI_Indian_Army.svg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'info');
                  },
                  child: Icon(
                    FontAwesomeIcons.infoCircle,
                    size: 35.0,
                  ),
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
                    text: ' $serviceName Admin',
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
            // Column(
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         SizedBox(
            //           width: 27.0,
            //         ),
            //         RedButton(
            //           text: 'Scan',
            //           width: 150.0,
            //           height: 20.0,
            //           c: Colors.redAccent,
            //           onPressed: () {
            //             Navigator.pushNamed(
            //               context,
            //               'qrscanner',
            //             );
            //           },
            //         ),
            //         RedButton(
            //           text: 'Update',
            //           width: 150.0,
            //           height: 20.0,
            //           c: Colors.redAccent,
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => infostream(
            //                         service: serviceName,
            //                       )),
            //             );
            //           },
            //         ),
            //         SizedBox(),
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         SizedBox(),
            //         RedButton(
            //           text: 'Show All',
            //           width: 150.0,
            //           height: 20.0,
            //           c: Colors.redAccent,
            //           onPressed: () {
            //             Navigator.pushNamed(
            //               context,
            //               'adminservices',
            //             );
            //           },
            //         ),
            //         RedButton(
            //           text: 'Logout',
            //           width: 100.0,
            //           height: 20.0,
            //           c: Colors.lightBlueAccent,
            //           onPressed: () {
            //             logout(context);
            //           },
            //         ),
            //         SizedBox(),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixed,
          backgroundColor: Colors.redAccent,
          items: [
            TabItem(icon: FontAwesomeIcons.qrcode, title: 'Scan'),
            TabItem(icon: FontAwesomeIcons.userEdit, title: 'Update'),
            TabItem(icon: FontAwesomeIcons.home, title: 'Home'),
            TabItem(icon: FontAwesomeIcons.list, title: 'Show All'),
            TabItem(icon: FontAwesomeIcons.signOutAlt, title: 'Logout'),
          ],
          initialActiveIndex: 2,
          onTap: (int i) {
            if (i == 0) {
              Navigator.pushNamed(
                context,
                'qrscanner',
              );
            } else if (i == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => infostream(
                          service: serviceName,
                        )),
              );
            } else if (i == 3) {
              Navigator.pushNamed(
                context,
                'adminservices',
              );
            } else if (i == 4) {
              logout(context);
            }
          },
        ),
      ),
    );
  }
}
