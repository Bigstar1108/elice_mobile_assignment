import 'dart:convert';

import 'package:elice_mobile_assignment/model/subject_card_model.dart';
import 'package:http/http.dart' show Client;

class SubjectApi {
  Client client = Client();
  final baseUrl = 'https://api-rest.elice.io/org/academy/course/list/';

  Future<List<SubjectCardModel>> getFreeSubjectData(
      int offset, int count) async {
    final response = await client.get(
        '$baseUrl?filter_is_free=true&filter_is_recommended=false&offset=$offset&count=$count');

    Map<String, dynamic> data = json.decode(response.body);

    String status = data['_result']['status']; // api status 값을 확인하기 위한 변수

    if (status == 'ok') {
      return (data['courses'] as List)
          .map((e) => SubjectCardModel.fromJson(e))
          .toList();
    } else {
      String errorMsg = data['_result']['reason'];
      throw Exception('Failed to load subject data, because of $errorMsg');
    }
  }

  Future<List<SubjectCardModel>> getRecSubjectData(
      int offset, int count) async {
    final response = await client.get(
        '$baseUrl?filter_is_free=false&filter_is_recommended=true&offset=$offset&count=$count');

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
