import 'package:elice_mobile_assignment/bloc/subject_bloc.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:tuple/tuple.dart';
import 'package:elice_mobile_assignment/widget/headers/home_header.dart';
import 'package:elice_mobile_assignment/widget/home/category.dart';
import 'package:elice_mobile_assignment/widget/home/subject_card.dart';
import 'package:flutter/material.dart';

const HomeBgColor = const Color(0xFFf6f7f8);
const LoadingTextColor = const Color(0xFF938dd0);

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SubjectBloc _subjectBloc = SubjectBloc();

  @override
  void initState() {
    super.initState();
    _subjectBloc.getFreeSubjectData(0, 10);
    _subjectBloc.getRecSubjectData(0, 10);
  }

  @override
  void dispose() {
    super.dispose();
    _subjectBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HomeBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HomeHeader(),
      ),
      body: SafeArea(
          bottom: false,
          child: Container(
              width: windowWidth,
              height: windowHeight,
              padding: EdgeInsets.only(
                  top: windowHeight * 0.03298, left: windowWidth * 0.0426),
              child: StreamBuilder2<List<SubjectCardModel>,
                  List<SubjectCardModel>>(
                streams: Tuple2(_subjectBloc.subjectFreeCardData,
                    _subjectBloc.subjectRecCardData),
                builder: (context, snapshots) {
                  return DraggableScrollableSheet(
                    maxChildSize: 1,
                    initialChildSize: 1,
                    minChildSize: 1,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            HomeCategory(
                                title: '추천 과목',
                                onPressCategory: () {
                                  Navigator.pushNamed(context, '/recommend');
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: windowHeight * 0.016)),
                            Container(
                                width: windowWidth,
                                height: windowHeight * 0.29975,
                                alignment: Alignment.center,
                                child: snapshots.item1.hasData
                                    ? ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: makeSubjectItems(
                                            snapshots.item1.data))
                                    : Text(
                                        "Loading...",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: LoadingTextColor),
                                      )),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: windowHeight * 0.0359),
                            ),
                            HomeCategory(
                                title: '무료 과목',
                                onPressCategory: () {
                                  Navigator.pushNamed(context, '/free');
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: windowHeight * 0.016)),
                            Container(
                                width: windowWidth,
                                height: windowHeight * 0.29975,
                                alignment: Alignment.center,
                                child: snapshots.item1.hasData
                                    ? ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: makeSubjectItems(
                                            snapshots.item1.data))
                                    : Text(
                                        "Loading...",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: LoadingTextColor),
                                      )),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: windowHeight * 0.0359),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ))),
    );
  }
}

List<Widget> makeSubjectItems(List<SubjectCardModel> data) {
  List<Widget> results = [];

  for (var i = 0; i < data.length; i++) {
    results.add(Row(
      children: <Widget>[
        SubjectCard(
          title: data[i].title,
          instructors: data[i].instructors,
          logoUrl: data[i].logoUrl,
          onPressCard: () {
            print("${data[i].title}을 클릭하셨습니다!");
          },
        ),
        Padding(padding: EdgeInsets.only(left: 13))
      ],
    ));
  }

  return results;
}
