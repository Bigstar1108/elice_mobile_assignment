import 'package:elice_mobile_assignment/api/subject_api.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';

class SubjectRepository {
  final subjectApi = SubjectApi();

  Future<List<SubjectCardModel>> getFreeSubjectData(int offset, int count) =>
      subjectApi.getFreeSubjectData(offset, count);

  Future<List<SubjectCardModel>> getRecSubjectData(int offset, int count) =>
      subjectApi.getRecSubjectData(offset, count);
}
