import 'package:elice_mobile_assignment/routes/home_route.dart';
import 'package:elice_mobile_assignment/screen/free_detail.dart';
import 'package:elice_mobile_assignment/screen/recommend_detail.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => HomeRoute(),
  '/free': (BuildContext context) => FreeDetail(),
  '/recommend': (BuildContext context) => RecommendDetail()
};
