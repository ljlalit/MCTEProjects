import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatelessWidget {
  final String userId;
  QrGenerator({this.userId});
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: userId,
      version: QrVersions.auto,
      size: 311.0,
    );
  }
}
