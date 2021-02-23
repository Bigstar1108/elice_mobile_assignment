import 'package:flutter/material.dart';

class QRHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 60,
      title: Text(
        'QR',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
