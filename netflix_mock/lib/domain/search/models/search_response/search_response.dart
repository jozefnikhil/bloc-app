import 'package:json_annotation/json_annotation.dart';

import 'content.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  String? query;
  List<Content> contents;

  SearchResponse({this.query, required this.contents});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
