// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_and_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotAndNewData _$HotAndNewDataFromJson(Map<String, dynamic> json) =>
    HotAndNewData(
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: json['page'] as int?,
    );

Map<String, dynamic> _$HotAndNewDataToJson(HotAndNewData instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'page': instance.page,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['_id'] as int?,
      backdropPath: json['backdrop_path'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      contentType: json['contentType'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      '_id': instance.id,
      'backdrop_path': instance.backdropPath,
      'genres': instance.genres,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'contentType': instance.contentType,
    };
