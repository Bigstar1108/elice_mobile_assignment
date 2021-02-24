import 'package:elice_mobile_assignment/screen/home.dart';
import 'package:elice_mobile_assignment/screen/qr.dart';
import 'package:elice_mobile_assignment/widget/navbar/bottomnavbar.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int screentype = 0;

  changeScreen(int index) {
    this.setState(() {
      screentype = index;
    });
  }

  showScreen() {
    switch (screentype) {
      case 0:
        return Home();
      case 1:
        return QRScreen();
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showScreen(),
      bottomNavigationBar: EliceBottomNavBar(
        onTappedItem: (index) => changeScreen(index),
      ),
    );
  }
}
