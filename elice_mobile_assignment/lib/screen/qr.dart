import 'dart:convert';
import 'dart:io';

import 'package:elice_mobile_assignment/screen/qr_webview.dart';
import 'package:elice_mobile_assignment/widget/headers/qr_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScreen extends StatefulWidget {
  _QRScreenState createState() => _QRScreenState();
}

const YellowHighlightColor = const Color(0xFFffff00);

class _QRScreenState extends State<QRScreen> {
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

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
              width: windowWidth,
              height: windowHeight,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  QRView(
                    key: qrkey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                        borderColor: YellowHighlightColor,
                        borderWidth: 2,
                        cutOutSize: 300.0),
                  ),
                  result != null
                      ? LinkPageBtn(
                          url: _checkBase64Url(result.code),
                          onPressBtn: () {
                            this.setState(() {
                              result = null;
                            });
                          },
                        )
                      : Positioned(
                          bottom: windowHeight * 0.2,
                          child: Text(
                            'QR 코드를 인식해주세요',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: YellowHighlightColor),
                          ))
                ],
              ))),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  String _checkBase64Url(String url) {
    var checkBase = url.contains('http');

    if (checkBase) {
      return url;
    } else {
      var transformUrl = utf8.decode(base64.decode(url));

      return transformUrl;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}

const LinkPageBtnColor = const Color(0xFF938dd0);

class LinkPageBtn extends StatelessWidget {
  LinkPageBtn({@required this.url, @required this.onPressBtn});

  final String url;
  final Function onPressBtn;

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          onPressBtn();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QRWebView(url: url)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 100,
              height: 30,
              alignment: Alignment.center,
              color: LinkPageBtnColor,
              child: Text(
                "Link to Page!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: windowHeight * 0.1))
          ],
        ));
  }
}
