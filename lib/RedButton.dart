import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String text;
  final Color c;
  final onPressed;
  final double width;
  final double height;
  RedButton({this.text, this.c, this.onPressed, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: c,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
