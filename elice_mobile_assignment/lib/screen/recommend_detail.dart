import 'package:flutter/material.dart';

class RecommendDetail extends StatefulWidget {
  @override
  _RecommendDetailState createState() => _RecommendDetailState();
}

class _RecommendDetailState extends State<RecommendDetail> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Text("_RecommendDetailState"),
    );
  }
}
