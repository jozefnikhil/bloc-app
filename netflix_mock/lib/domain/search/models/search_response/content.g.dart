// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
    )
      ..id = json['_id'] as int?
      ..overview = json['overview'] as String?;

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      '_id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
