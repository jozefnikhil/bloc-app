// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Downloads5 _$Downloads5FromJson(Map<String, dynamic> json) {
  return _Downloads5.fromJson(json);
}

/// @nodoc
mixin _$Downloads5 {
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String? get originalTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Downloads5CopyWith<Downloads5> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Downloads5CopyWith<$Res> {
  factory $Downloads5CopyWith(
          Downloads5 value, $Res Function(Downloads5) then) =
      _$Downloads5CopyWithImpl<$Res, Downloads5>;
  @useResult
  $Res call(
      {@JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'original_title') String? originalTitle});
}

/// @nodoc
class _$Downloads5CopyWithImpl<$Res, $Val extends Downloads5>
    implements $Downloads5CopyWith<$Res> {
  _$Downloads5CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? originalTitle = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Downloads5ImplCopyWith<$Res>
    implements $Downloads5CopyWith<$Res> {
  factory _$$Downloads5ImplCopyWith(
          _$Downloads5Impl value, $Res Function(_$Downloads5Impl) then) =
      __$$Downloads5ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'original_title') String? originalTitle});
}

/// @nodoc
class __$$Downloads5ImplCopyWithImpl<$Res>
    extends _$Downloads5CopyWithImpl<$Res, _$Downloads5Impl>
    implements _$$Downloads5ImplCopyWith<$Res> {
  __$$Downloads5ImplCopyWithImpl(
      _$Downloads5Impl _value, $Res Function(_$Downloads5Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? originalTitle = freezed,
  }) {
    return _then(_$Downloads5Impl(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Downloads5Impl implements _Downloads5 {
  const _$Downloads5Impl(
      {@JsonKey(name: 'poster_path') required this.posterPath,
      @JsonKey(name: 'original_title') required this.originalTitle});

  factory _$Downloads5Impl.fromJson(Map<String, dynamic> json) =>
      _$$Downloads5ImplFromJson(json);

  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @override
  String toString() {
    return 'Downloads5(posterPath: $posterPath, originalTitle: $originalTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Downloads5Impl &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, posterPath, originalTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Downloads5ImplCopyWith<_$Downloads5Impl> get copyWith =>
      __$$Downloads5ImplCopyWithImpl<_$Downloads5Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Downloads5ImplToJson(
      this,
    );
  }
}

abstract class _Downloads5 implements Downloads5 {
  const factory _Downloads5(
      {@JsonKey(name: 'poster_path') required final String? posterPath,
      @JsonKey(name: 'original_title')
      required final String? originalTitle}) = _$Downloads5Impl;

  factory _Downloads5.fromJson(Map<String, dynamic> json) =
      _$Downloads5Impl.fromJson;

  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'original_title')
  String? get originalTitle;
  @override
  @JsonKey(ignore: true)
  _$$Downloads5ImplCopyWith<_$Downloads5Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
