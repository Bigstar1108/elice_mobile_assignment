import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(EliceMobile());
}

class EliceMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviss App',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
    );
  }
}
