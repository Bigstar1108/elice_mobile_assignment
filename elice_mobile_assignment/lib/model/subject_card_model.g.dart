// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectCardModel _$SubjectCardModelFromJson(Map<String, dynamic> json) {
  return SubjectCardModel(
    title: json['title'] as String,
    logoUrl: json['logo_file_url'] as String,
    instructors: json['instructors'] as List,
  );
}

Map<String, dynamic> _$SubjectCardModelToJson(SubjectCardModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'logo_file_url': instance.logoUrl,
      'instructors': instance.instructors,
    };
