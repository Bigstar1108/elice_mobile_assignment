import 'package:flutter/material.dart';

const DetailHeaderBgColor = const Color(0xFF202044);

class DetailHeader extends StatelessWidget {
  DetailHeader({@required this.title, @required this.height});

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DetailHeaderBgColor,
      brightness: Brightness.dark,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: height,
      title: Text(
        '$title',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
