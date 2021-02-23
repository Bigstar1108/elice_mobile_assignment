import 'package:flutter/material.dart';
import 'package:elice_mobile_assignment/widget/share/network_badge.dart';

/*
    해당 컴포넌트는 무료 과목, 추천 과목 전체보기 페이지의 card 컴포넌트 입니다.
 */

class DetailSubjectCard extends StatelessWidget {
  DetailSubjectCard(
      {@required this.title,
      @required this.logoUrl,
      @required this.instructors,
      @required this.onPressCard});

  final String title;
  final String logoUrl;
  final List instructors;
  final Function onPressCard;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: windowHeight * 0.0209)),
        GestureDetector(
          onTap: onPressCard,
          child: Container(
            width: windowWidth * 0.9397,
            height: windowHeight * 0.1799,
            padding: EdgeInsets.fromLTRB(
                windowWidth * 0.042,
                windowHeight * 0.0239,
                windowWidth * 0.084,
                windowHeight * 0.0239),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: (windowHeight * 0.1799) - (windowHeight * 0.0478),
                  child: Image.network('$logoUrl'),
                ),
                Padding(padding: EdgeInsets.only(left: windowWidth * 0.042)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "$title",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      instructors.length == 0
                          ? "선생님 미등록"
                          : '${instructors[0]['fullname']} 선생님',
                      style: TextStyle(fontSize: 12, color: Color(0xFF7e7e7e)),
                    ),
                    NetworkBadge(networkType: false)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
