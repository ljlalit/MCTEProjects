import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
            Expanded(
              child: Column(
                children: [
                  Text('DSOI info.'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('Swimming Pool info.'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('Movie hall info.'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('Sports centre info.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
