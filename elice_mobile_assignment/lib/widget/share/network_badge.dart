import 'package:flutter/material.dart';

/*
    해당 컴포넌트는 Subject Card의 온라인, 오프라인 상태를 나타내는 뱃지 컴포넌트 입니다.

    Required Props {
        bool networkType = 온라인, 오프라인을 판단하기 위한 props, true ? 온라인 : 오프라인.
    }
 */

class NetworkBadge extends StatelessWidget {
  NetworkBadge({@required this.networkType});

  final bool networkType;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: windowWidth * 0.1315,
      height: windowHeight * 0.0329,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Color(0xFF0078b5),
      ),
      child: Text(
        networkType ? "온라인" : "오프라인",
        style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
