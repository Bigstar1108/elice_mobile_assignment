import 'dart:convert';

import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart';

class SubjectApi {
  Client client = Client();
  final baseUrl = 'https://api-rest.elice.io/org/academy/course/list/';

  Future<List<SubjectCardModel>> getSubjectData(
      bool isFilter, int offset, int count) async {
    // isFilter ? 무료과목 : 추천 과목
    final response = await client.get(
        '$baseUrl?filter_is_free=$isFilter&filter_is_recommended=${!isFilter}&offset=$offset&count=$count');

    Map<String, dynamic> data = json.decode(response.body);

    String status = data['_result']['status'];

    if (status == 'ok') {
      return (data['courses'] as List)
          .map((e) => SubjectCardModel.fromJson(e))
          .toList();
    } else {
      String errorMsg = data['_result']['reason'];
      throw Exception('Failed to load subject data, because of $errorMsg');
    }
  }
}
