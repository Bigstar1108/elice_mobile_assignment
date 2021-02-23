import 'package:json_annotation/json_annotation.dart';
part 'subject_card_model.g.dart';

@JsonSerializable(nullable: false)
class SubjectCardModel {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'logo_file_url')
  String logoUrl;
  @JsonKey(name: 'instructors')
  List instructors;

  SubjectCardModel({this.title, this.logoUrl, this.instructors});

  factory SubjectCardModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectCardModelToJson(this);
}
