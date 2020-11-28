import 'package:QRhelp/adminservices.dart';
import 'package:QRhelp/home2.dart';
import 'package:QRhelp/infostream.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:QRhelp/RedButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:QRhelp/qrscanner.dart';
import 'info.dart';

// ignore: camel_case_types
class adminhome extends StatefulWidget {
  String service;
  adminhome({this.service});
  @override
  _adminhomeState createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  final _auth = FirebaseAuth.instance;
  final pageList = [];
  static String serviceName;
  int selectedPage;
  var pageList2;

  @override
  void initState() {
    super.initState();
    serviceName = widget.service.toString();
    selectedPage = 2;
    pageList2 = [
      QRViewExample(),
      infostream(serviceN: serviceName),
      home2(serviceN: serviceName),
      adminservices(),
      Info(),
    ];
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: pageList2[selectedPage],
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.redAccent,
          items: [
            TabItem(icon: FontAwesomeIcons.qrcode, title: 'Scan'),
            TabItem(icon: FontAwesomeIcons.userEdit, title: 'Update'),
            TabItem(icon: FontAwesomeIcons.home, title: 'Home'),
            TabItem(icon: FontAwesomeIcons.list, title: 'Show All'),
            TabItem(icon: FontAwesomeIcons.info, title: 'Info'),
          ],
          initialActiveIndex: 2,
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
            //   if (i == 0) {
            //     Navigator.pushNamed(
            //       context,
            //       'qrscanner',
            //     );
            //   } else if (i == 1) {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => infostream(
            //                 service: serviceName,
            //               )),
            //     );
            //   } else if (i == 2) {
            //   } else if (i == 3) {
            //     Navigator.pushNamed(
            //       context,
            //       'adminservices',
            //     );
            //   } else if (i == 4) {
            //     logout(context);
            //   }
          },
        ),
      ),
    );
  }
}
