import 'package:flutter/material.dart';

class QRHeader extends StatelessWidget {
  QRHeader({@required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: height,
      title: Text(
        'QR',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
