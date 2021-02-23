import 'package:elice_mobile_assignment/widget/logo/elice_logo.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 60,
      title: EliceLogo(),
      actions: [
        IconButton(
            icon: SizedBox(
              width: 18,
              height: 20,
              child: Image.asset('images/header/notifications.png'),
            ),
            onPressed: () {
              print("Notification, 개발 진행중...");
            }),
      ],
    );
  }
}
