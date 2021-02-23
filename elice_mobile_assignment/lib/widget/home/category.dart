import 'package:flutter/material.dart';

/* 
    해당 컴포넌트는 Home 화면의 과목과 전체보기를 공동으로 묶어 작업한 컴포넌트 입니다.
*/

const SeeAllFontColor = const Color(0xFF564ea9);

class HomeCategory extends StatelessWidget {
  HomeCategory({@required this.title, @required this.onPressCategory});

  final String title;
  final Function onPressCategory;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$title',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        GestureDetector(
            onTap: this.onPressCategory,
            child: Padding(
              padding: EdgeInsets.only(right: windowWidth * 0.0426),
              child: Text(
                '전체보기',
                style: TextStyle(fontSize: 10, color: SeeAllFontColor),
              ),
            ))
      ],
    );
  }
}
