import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.freezed.dart';
part 'downloads.g.dart';

@freezed
class Downloads5 with _$Downloads5 {
  const factory Downloads5(
          {@JsonKey(name: 'poster_path') required String? posterPath,
          @JsonKey(name: 'original_title') required String? originalTitle}) =
      _Downloads5;

  factory Downloads5.fromJson(Map<String, dynamic> json) =>
      _$Downloads5FromJson(json);
}
