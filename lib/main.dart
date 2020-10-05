import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:QRhelp/login.dart';

void main() {

  runApp(login());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Stack(
                  children: <Widget>[
                    // RaisedButton.icon(
                    //     onPressed: null,
                    //     icon: Icon(Icons.arrow_upward),
                    //     label: Text(''),),
                    Positioned(
                        left: 30,
                        top: 60,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 18),
                            ),
                            onTap: null,
                          ),
                        )),
                    Positioned(
                      left: 80,
                      top: 60,
                      child: Container(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 45,
                        right: 10,
                        height: 40,
                        child: Container(
                            color: Color.fromRGBO(217, 0, 0, 100),
                            child: Image(
                              image: AssetImage(
                                  'assets/ADGPI_Indian_Army.svg.png'),
                            ))),
                  ],
                )),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                        text: 'Hello, ',
                        style: TextStyle(color: Colors.black, fontSize: 48),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'User',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  '\nMilitary College of Telecommunication Engineering',
                              style: TextStyle(fontSize: 20))
                        ]),
                  ),
                ),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                      Expanded(
                          child: new TextField(
                        decoration: new InputDecoration(hintText: 'Name'),
                        style: TextStyle(fontSize: 20),
                      )),
                      Expanded(child: Text('')),
                      Expanded(
                          child: new TextField(
                        decoration: new InputDecoration(hintText: 'Rank'),
                        style: TextStyle(fontSize: 20),
                      )),
                      Expanded(child: Text('')),
                      Expanded(
                          child: new TextField(
                        decoration: new InputDecoration(hintText: 'Number'),
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                        //     inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ]
                      )),
                      Expanded(child: Text('')),
                      Expanded(
                          child: new TextField(
                        decoration: new InputDecoration(hintText: 'Unit'),
                        style: TextStyle(fontSize: 20),
                      )),
                    ])),
                Expanded(child: Text('')),
                Expanded(
                    child: InkWell(
                        child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 15),
                )))
              ])),
    )));
  }
}
