import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  @JsonKey(name: '_id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  Content({
    this.originalTitle,
    this.posterPath,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
