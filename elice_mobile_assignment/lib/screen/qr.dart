import 'package:elice_mobile_assignment/widget/headers/qr_header.dart';
import 'package:flutter/material.dart';

class QRScreen extends StatefulWidget {
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: QRHeader(),
      ),
      body: SafeArea(
          bottom: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
            child: Text("_QRScreenState"),
          )),
    );
  }
}
