import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRWebView extends StatelessWidget {
  QRWebView({@required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}
