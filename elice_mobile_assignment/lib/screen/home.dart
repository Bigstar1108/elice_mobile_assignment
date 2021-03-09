import 'package:elice_mobile_assignment/bloc/subject_bloc.dart';
import 'package:elice_mobile_assignment/bloc/subject_event.dart';
import 'package:elice_mobile_assignment/bloc/subject_state.dart';
import 'package:elice_mobile_assignment/screen/subject_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elice_mobile_assignment/widget/headers/home_header.dart';
import 'package:elice_mobile_assignment/widget/home/category.dart';
import 'package:elice_mobile_assignment/widget/home/subject_card.dart';
import 'package:flutter/material.dart';

const HomeBgColor = const Color(0xFFf6f7f8);
const LoadingTextColor = const Color(0xFF938dd0);
const AppBarHeight = 60.0;

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SubjectBloc _subjectBloc = SubjectBloc();

  @override
  void initState() {
    super.initState();
    _loadSubject();
  }

  _loadSubject() {
    _subjectBloc.add(SubjectGetFreeSubjectEvent(count: 10, offset: 0));
    _subjectBloc.add(SubjectGetRecommendedSubjectEvent(count: 10, offset: 0));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HomeBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppBarHeight),
        child: HomeHeader(
          height: AppBarHeight,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: windowWidth,
          height: windowHeight,
          padding: EdgeInsets.only(
              top: windowHeight * 0.03298, left: windowWidth * 0.0426),
          child: BlocBuilder(
            builder: (BuildContext context, SubjectState state) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HomeCategory(
                        title: '추천 과목',
                        onPressCategory: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SubjectDetail(isFilter: false)));
                        }),
                    Padding(
                        padding: EdgeInsets.only(bottom: windowHeight * 0.016)),
                    Container(
                        width: windowWidth,
                        height: windowHeight * 0.29975,
                        alignment: Alignment.center,
                        child: state is SubjectSuccessState
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.freeSubjectData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: <Widget>[
                                      SubjectCard(
                                        title:
                                            state.freeSubjectData[index].title,
                                        instructors: state
                                            .freeSubjectData[index].instructors,
                                        logoUrl: state
                                            .freeSubjectData[index].logoUrl,
                                        onPressCard: () {
                                          print(
                                              "${state.freeSubjectData[index].title}을 클릭하셨습니다!");
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 13))
                                    ],
                                  );
                                })
                            : Text(
                                "Recommend Subject Loading...",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: LoadingTextColor),
                              )),
                    Padding(
                      padding: EdgeInsets.only(bottom: windowHeight * 0.0359),
                    ),
                    HomeCategory(
                        title: '무료 과목',
                        onPressCategory: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SubjectDetail(isFilter: true)));
                        }),
                    Padding(
                        padding: EdgeInsets.only(bottom: windowHeight * 0.016)),
                    Container(
                        width: windowWidth,
                        height: windowHeight * 0.29975,
                        alignment: Alignment.center,
                        child: state is SubjectSuccessState
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.recommendSubjectData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: <Widget>[
                                      SubjectCard(
                                        title: state
                                            .recommendSubjectData[index].title,
                                        instructors: state
                                            .recommendSubjectData[index]
                                            .instructors,
                                        logoUrl: state
                                            .recommendSubjectData[index]
                                            .logoUrl,
                                        onPressCard: () {
                                          print(
                                              "${state.recommendSubjectData[index].title}을 클릭하셨습니다!");
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 13))
                                    ],
                                  );
                                })
                            : Text(
                                "Free Subject Loading...",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: LoadingTextColor),
                              )),
                    Padding(
                      padding: EdgeInsets.only(bottom: windowHeight * 0.0359),
                    ),
                  ],
                ),
              );
            },
            bloc: _subjectBloc,
          ),
        ),
      ),
    );
  }
}
