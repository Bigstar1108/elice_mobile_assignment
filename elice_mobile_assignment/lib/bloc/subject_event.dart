import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SubjectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubjectGetFreeSubjectEvent extends SubjectEvent{
  final int offset;
  final int count;
  SubjectGetFreeSubjectEvent({@required this.offset, @required this.count});

  @override
  List get props => [offset, count];
}

class SubjectGetRecommendedSubjectEvent extends SubjectEvent{
final int offset;
  final int count;
  SubjectGetRecommendedSubjectEvent({@required this.offset, @required this.count});

  @override
  List get props => [offset, count];
}