import 'package:elice_mobile_assignment/api/subject_api.dart';
import 'package:elice_mobile_assignment/model/subject_card_model.dart';

class SubjectRepository {
  final subjectApi = SubjectApi();

  Future<List<SubjectCardModel>> getSubjectData(
          bool isFilter, int offset, int count) =>
      subjectApi.getSubjectData(isFilter, offset, count);
}
