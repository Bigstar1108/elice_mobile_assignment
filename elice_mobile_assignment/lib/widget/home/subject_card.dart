import 'package:elice_mobile_assignment/widget/share/network_badge.dart';
import 'package:flutter/material.dart';

/*
    해당 컴포넌트는 홈 화면에 있는 과목 카드 컴포넌트 입니다.
 */

class SubjectCard extends StatelessWidget {
  SubjectCard(
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
    return GestureDetector(
        onTap: onPressCard,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 12),
                blurRadius: 20,
                spreadRadius: -20,
                color: Colors.black)
          ]),
          child: Column(
            children: <Widget>[
              Container(
                width: windowWidth * 0.426,
                height: windowHeight * 0.2038,
                padding: EdgeInsets.only(
                    left: windowWidth * 0.0328,
                    right: windowWidth * 0.0328,
                    top: windowHeight * 0.0254),
                decoration: BoxDecoration(
                    color: Color(0xFF938dd0),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(8),
                        topRight: const Radius.circular(8))),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: windowHeight * 0.0659,
                      height: windowHeight * 0.0659,
                      child: Image.network('$logoUrl'),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(bottom: windowHeight * 0.0209)),
                    Text(
                      '$title',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                width: windowWidth * 0.426,
                height: windowHeight * 0.09595,
                padding: EdgeInsets.only(left: windowWidth * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(8),
                      bottomRight: const Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      instructors.length == 0
                          ? "선생님 미등록"
                          : '${instructors[0]['fullname']} 선생님',
                      style: TextStyle(fontSize: 12, color: Color(0xFF797a7b)),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 7)),
                    NetworkBadge(networkType: false)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
