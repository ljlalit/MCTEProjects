import 'package:flutter/material.dart';
import 'constants.dart';

class BuildTextField extends StatelessWidget {
  final onChanged;
  final String ltext;
  final bool otext;
  final TextInputType kType;
  BuildTextField({this.ltext, this.onChanged, this.otext, this.kType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: kType,
      obscureText: otext,
      onChanged: onChanged,
      decoration: kTextFieldDecoration.copyWith(
        labelText: ltext,
      ),
      style: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 24,
      ),
      textAlign: TextAlign.left,
    );
  }
}
