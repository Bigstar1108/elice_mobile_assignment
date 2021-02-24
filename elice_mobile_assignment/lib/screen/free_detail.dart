import 'dart:ui';

import 'package:elice_mobile_assignment/bloc/subject_bloc.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:elice_mobile_assignment/widget/detail/detail_subject_card.dart';
import 'package:elice_mobile_assignment/widget/headers/detail_header.dart';
import 'package:flutter/material.dart';

const DetailBgColor = const Color(0xFFf6f7f8);

class FreeDetail extends StatefulWidget {
  @override
  _FreeDetailState createState() => _FreeDetailState();
}

class _FreeDetailState extends State<FreeDetail> {
  final SubjectBloc _subjectBloc = SubjectBloc();
  ScrollController _scrollController;
  int _currentOffset = 0;

  @override
  void initState() {
    super.initState();
    _subjectBloc.getSubjectData(true, _currentOffset, 10);
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
      _subjectBloc.getSubjectData(true, _currentOffset + 1, 10);
      this.setState(() {
        _currentOffset = _currentOffset + 1;
      });
    }
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    _subjectBloc.clearSubjectData(true);
    _subjectBloc.getSubjectData(true, 0, 10);
    this.setState(() {
      _currentOffset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: DetailBgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: DetailHeader(
            title: '무료 과목',
          ),
        ),
        body: Container(
            width: windowWidth,
            height: windowHeight,
            child: StreamBuilder(
              stream: _subjectBloc.subjectFreeCardData,
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
