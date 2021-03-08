import 'dart:ui';

import 'package:elice_mobile_assignment/bloc/subject_bloc.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:elice_mobile_assignment/widget/detail/detail_subject_card.dart';
import 'package:elice_mobile_assignment/widget/headers/detail_header.dart';
import 'package:flutter/material.dart';

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
      return _subjectBloc.getFreeSubjectData(offset, count);
    } else {
      return _subjectBloc.getRecSubjectData(offset, count);
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
    _subjectBloc.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      isFilter(
          widget.isFilter,
          widget.isFilter
              ? _subjectBloc.allFreeSubjectData.length
              : _subjectBloc.allRecSubjectData.length,
          10);
    }
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    _subjectBloc.clearSubjectData(widget.isFilter);
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
            child: StreamBuilder(
              stream: widget.isFilter
                  ? _subjectBloc.subjectFreeCardData
                  : _subjectBloc.subjectRecCardData,
              builder:
                  (context, AsyncSnapshot<List<SubjectCardModel>> snapshot) {
                if (snapshot.hasData) {
                  return RefreshIndicator(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                DetailSubjectCard(
                                  title: snapshot.data[index].title,
                                  instructors: snapshot.data[index].instructors,
                                  logoUrl: snapshot.data[index].logoUrl,
                                  onPressCard: () {
                                    print(
                                        "${snapshot.data[index].title}을 클릭하셨습니다!");
                                  },
                                ),
                              ],
                            );
                          }),
                      onRefresh: _refreshData);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}
