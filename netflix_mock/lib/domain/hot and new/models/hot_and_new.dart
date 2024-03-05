import 'package:json_annotation/json_annotation.dart';


part 'hot_and_new.g.dart';

@JsonSerializable()
class HotAndNewData {
  List<Movie>? movies;

  int? page;

  HotAndNewData({this.movies = const [], this.page});

  factory HotAndNewData.fromJson(Map<String, dynamic> json) =>
      _$HotAndNewDataFromJson(json);

  Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
@JsonSerializable()
class Movie {
  @JsonKey(name: '_id')
  int? id;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  List<String>? genres;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  String? contentType;

  Movie({
    this.id,
    this.backdropPath,
    this.genres,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.contentType,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}