import 'package:elice_mobile_assignment/routes/home_route.dart';
import 'package:elice_mobile_assignment/screen/free_detail.dart';
import 'package:elice_mobile_assignment/screen/qr_webview.dart';
import 'package:elice_mobile_assignment/screen/recommend_detail.dart';
import 'package:elice_mobile_assignment/screen/subject_detail.dart';
import 'package:flutter/material.dart';

const rootRoute = '/';
const subjectDetail = '/subjectdetail';
const qrWebView = '/qrwebview';

final routes = {
  rootRoute: (BuildContext context) => HomeRoute(),
  // '/free': (BuildContext context) => FreeDetail(),
  // '/recommend': (BuildContext context) => RecommendDetail(),
  qrWebView: (BuildContext context) => QRWebView(url: ''),
  subjectDetail: (BuildContext context) => SubjectDetail(isFilter: true),
};
