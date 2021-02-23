import 'package:flutter/material.dart';

const DetailHeaderBgColor = const Color(0xFF202044);

class DetailHeader extends StatelessWidget {
  DetailHeader({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DetailHeaderBgColor,
      brightness: Brightness.dark,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 60,
      title: Text(
        '$title',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
