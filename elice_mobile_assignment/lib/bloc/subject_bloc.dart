import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:elice_mobile_assignment/repository/subject_repository.dart';
import 'package:rxdart/rxdart.dart';

// Recommend = Rec으로 정의합니다.

class SubjectBloc {
  final _subjectRepository = SubjectRepository();
  final _subjectFreeCardData = PublishSubject<List<SubjectCardModel>>();
  final _subjectRecCardData = PublishSubject<List<SubjectCardModel>>();

  Stream<List<SubjectCardModel>> get subjectFreeCardData =>
      _subjectFreeCardData.stream;
  Stream<List<SubjectCardModel>> get subjectRecCardData =>
      _subjectRecCardData.stream;
  List<SubjectCardModel> allFreeSubjectData = [];
  List<SubjectCardModel> allRecSubjectData = [];

  getSubjectData(bool isFilter, int offset, int count) async {
    List<SubjectCardModel> subjectDataList =
        await _subjectRepository.getSubjectData(isFilter, offset, count);

    if (isFilter) {
      allFreeSubjectData.addAll(subjectDataList);

      _subjectFreeCardData.sink.add(allFreeSubjectData);
    } else {
      allRecSubjectData.addAll(subjectDataList);

      _subjectRecCardData.sink.add(allRecSubjectData);
    }
  }

  dispose() {
    _subjectFreeCardData.close();
    _subjectRecCardData.close();
  }
}