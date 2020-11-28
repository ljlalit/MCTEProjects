import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final _firestore = FirebaseFirestore.instance;
  var docref;
  var data;
  String dsoi = "Loading...";
  String swimpool = "Loading...";
  String movie = "Loading...";
  String sports = "Loading...";
  @override
  void initState() {
    super.initState();
    getData();
  }
  
  void getData() {
    docref = _firestore.collection("servicedescription");
    docref.getDocuments().then((querySnapshot){
    querySnapshot.documents.forEach((doc){

      if(doc.id == "dsoi"){
        setState(() { dsoi = doc.get('description'); });
      } else if(doc.id == "swimmingpool"){
        setState(() {swimpool = doc.get('description'); });
        
      } else if(doc.id == "sportscenter"){
        setState(() { sports = doc.get('description'); });
        
      } else if(doc.id == "moviehall"){
        setState(() { movie = doc.get('description'); });
        
      }

    });
    });
    print("jai hanuman");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: Icon(
            Icons.info,
          ),
          title: Text(
            'Info',
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'DSOI'),
              Tab(text: 'Swimming Pool'),
              Tab(text: 'Movie Hall'),
              Tab(text: 'Sports Centre'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Text(dsoi),
              ],
            ),
            Column(
              children: [
                Text(swimpool),
              ],
            ),
            Column(
              children: [
                Text(movie),
              ],
            ),
            Column(
              children: [
                Text(sports),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
