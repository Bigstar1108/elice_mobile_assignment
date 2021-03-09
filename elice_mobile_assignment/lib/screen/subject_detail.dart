import 'dart:ui';

import 'package:elice_mobile_assignment/bloc/subject_bloc.dart';
import 'package:elice_mobile_assignment/bloc/subject_event.dart';
import 'package:elice_mobile_assignment/bloc/subject_state.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:elice_mobile_assignment/widget/detail/detail_subject_card.dart';
import 'package:elice_mobile_assignment/widget/headers/detail_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const DetailBgColor = const Color(0xFFf6f7f8);
const AppBarHeight = 60.0;

class SubjectDetail extends StatefulWidget {
  SubjectDetail({@required this.isFilter});

  final bool isFilter; // isFilter ? 무료 과목 : 추천 과목

  @override
  _SubjectDetailState createState() => _SubjectDetailState();
}

class _SubjectDetailState extends State<SubjectDetail> {
  final SubjectBloc _subjectBloc = SubjectBloc();
  ScrollController _scrollController;

  isFilter(bool isFilter, int offset, int count) {
    if (isFilter) {
      return _subjectBloc
          .add(SubjectGetFreeSubjectEvent(count: count, offset: offset));
    } else {
      return _subjectBloc
          .add(SubjectGetRecommendedSubjectEvent(count: count, offset: offset));
    }
  }

  @override
  void initState() {
    super.initState();
    isFilter(widget.isFilter, 0, 10);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      isFilter(widget.isFilter, null, 10);
    }
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    isFilter(widget.isFilter, 0, 10);
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DetailBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppBarHeight),
        child: DetailHeader(
          title: widget.isFilter ? '무료 과목' : '추천 과목',
          height: AppBarHeight,
        ),
      ),
      body: Container(
        width: windowWidth,
        height: windowHeight,
        child: BlocBuilder(
          condition: (previousState, currentState) {
            // true ? 리빌드 : 리빌드 하지 않음
            if (previousState is SubjectSuccessState &&
                currentState is SubjectLoadingState) {
              return false;
            } else {
              return true;
            }
          },
          bloc: _subjectBloc,
          builder: (context, state) {
            if (state is SubjectSuccessState) {
              return RefreshIndicator(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    itemCount: widget.isFilter
                        ? state.freeSubjectData.length
                        : state.recommendSubjectData.length,
                    itemBuilder: (BuildContext context, int index) {
                      // widget.isFilter ? 무료 과목 : 추천 과목
                      var list = widget.isFilter
                          ? state.freeSubjectData
                          : state.recommendSubjectData;
                      return Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 5)),
                          DetailSubjectCard(
                            title: list[index].title,
                            instructors: list[index].instructors,
                            logoUrl: list[index].logoUrl,
                            onPressCard: () {
                              print("${list[index].title}을 클릭하셨습니다!");
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  onRefresh: _refreshData);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
