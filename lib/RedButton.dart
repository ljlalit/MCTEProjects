import 'package:flutter/material.dart';

class RedButton {
  final String text;
  final onPressed;
  RedButton({this.text, this.onPressed});
  Container buildButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffe53935),
        boxShadow: [
          BoxShadow(
            color: const Color(0xc4000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'NeueKabel',
            fontSize: 29,
            color: const Color(0xffffffff),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
