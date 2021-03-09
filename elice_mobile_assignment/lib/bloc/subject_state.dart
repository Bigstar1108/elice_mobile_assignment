import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SubjectState extends Equatable{
  @override
  List<Object> get props => [];
}

class SubjectInitialState extends SubjectState{}

class SubjectLoadingState extends SubjectState{}

class SubjectSuccessState extends SubjectState{
  final List<SubjectCardModel> freeSubjectData;
  final List<SubjectCardModel> recommendSubjectData;
  SubjectSuccessState({@required this.freeSubjectData, @required this.recommendSubjectData});

  @override
  List<Object> get props => [freeSubjectData, recommendSubjectData];
}

class SubjectErrorState extends SubjectState{
  final FlutterError error;
  SubjectErrorState({@required this.error});
}