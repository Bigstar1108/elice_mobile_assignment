import 'package:flutter/material.dart';

class EliceLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: windowWidth * 0.2879,
        height: 32.9,
        child: Image.asset(
          'images/logo/elice_pupple_logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
