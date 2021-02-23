import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elice_mobile_assignment/routes/routes.dart';

void main() {
  runApp(EliceMobile());
}

class EliceMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elice Mobile Assignment',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      routes: routes,
    );
  }
}
