// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) {
  return _MovieDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieDetailResponse {
  String? get backdrop_path => throw _privateConstructorUsedError;
  String? get origin_country => throw _privateConstructorUsedError;
  String? get original_language => throw _privateConstructorUsedError;
  String? get original_title => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  String? get release_date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this MovieDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieDetailResponseCopyWith<MovieDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailResponseCopyWith<$Res> {
  factory $MovieDetailResponseCopyWith(
    MovieDetailResponse value,
    $Res Function(MovieDetailResponse) then,
  ) = _$MovieDetailResponseCopyWithImpl<$Res, MovieDetailResponse>;
  @useResult
  $Res call({
    String? backdrop_path,
    String? origin_country,
    String? original_language,
    String? original_title,
    String? overview,
    String? release_date,
    String? status,
  });
}

/// @nodoc
class _$MovieDetailResponseCopyWithImpl<$Res, $Val extends MovieDetailResponse>
    implements $MovieDetailResponseCopyWith<$Res> {
  _$MovieDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdrop_path = freezed,
    Object? origin_country = freezed,
    Object? original_language = freezed,
    Object? original_title = freezed,
    Object? overview = freezed,
    Object? release_date = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            backdrop_path: freezed == backdrop_path
                ? _value.backdrop_path
                : backdrop_path // ignore: cast_nullable_to_non_nullable
                      as String?,
            origin_country: freezed == origin_country
                ? _value.origin_country
                : origin_country // ignore: cast_nullable_to_non_nullable
                      as String?,
            original_language: freezed == original_language
                ? _value.original_language
                : original_language // ignore: cast_nullable_to_non_nullable
                      as String?,
            original_title: freezed == original_title
                ? _value.original_title
                : original_title // ignore: cast_nullable_to_non_nullable
                      as String?,
            overview: freezed == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String?,
            release_date: freezed == release_date
                ? _value.release_date
                : release_date // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieDetailResponseImplCopyWith<$Res>
    implements $MovieDetailResponseCopyWith<$Res> {
  factory _$$MovieDetailResponseImplCopyWith(
    _$MovieDetailResponseImpl value,
    $Res Function(_$MovieDetailResponseImpl) then,
  ) = __$$MovieDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? backdrop_path,
    String? origin_country,
    String? original_language,
    String? original_title,
    String? overview,
    String? release_date,
    String? status,
  });
}

/// @nodoc
class __$$MovieDetailResponseImplCopyWithImpl<$Res>
    extends _$MovieDetailResponseCopyWithImpl<$Res, _$MovieDetailResponseImpl>
    implements _$$MovieDetailResponseImplCopyWith<$Res> {
  __$$MovieDetailResponseImplCopyWithImpl(
    _$MovieDetailResponseImpl _value,
    $Res Function(_$MovieDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdrop_path = freezed,
    Object? origin_country = freezed,
    Object? original_language = freezed,
    Object? original_title = freezed,
    Object? overview = freezed,
    Object? release_date = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$MovieDetailResponseImpl(
        backdrop_path: freezed == backdrop_path
            ? _value.backdrop_path
            : backdrop_path // ignore: cast_nullable_to_non_nullable
                  as String?,
        origin_country: freezed == origin_country
            ? _value.origin_country
            : origin_country // ignore: cast_nullable_to_non_nullable
                  as String?,
        original_language: freezed == original_language
            ? _value.original_language
            : original_language // ignore: cast_nullable_to_non_nullable
                  as String?,
        original_title: freezed == original_title
            ? _value.original_title
            : original_title // ignore: cast_nullable_to_non_nullable
                  as String?,
        overview: freezed == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String?,
        release_date: freezed == release_date
            ? _value.release_date
            : release_date // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieDetailResponseImpl implements _MovieDetailResponse {
  const _$MovieDetailResponseImpl({
    this.backdrop_path,
    this.origin_country,
    this.original_language,
    this.original_title,
    this.overview,
    this.release_date,
    this.status,
  });

  factory _$MovieDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieDetailResponseImplFromJson(json);

  @override
  final String? backdrop_path;
  @override
  final String? origin_country;
  @override
  final String? original_language;
  @override
  final String? original_title;
  @override
  final String? overview;
  @override
  final String? release_date;
  @override
  final String? status;

  @override
  String toString() {
    return 'MovieDetailResponse(backdrop_path: $backdrop_path, origin_country: $origin_country, original_language: $original_language, original_title: $original_title, overview: $overview, release_date: $release_date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailResponseImpl &&
            (identical(other.backdrop_path, backdrop_path) ||
                other.backdrop_path == backdrop_path) &&
            (identical(other.origin_country, origin_country) ||
                other.origin_country == origin_country) &&
            (identical(other.original_language, original_language) ||
                other.original_language == original_language) &&
            (identical(other.original_title, original_title) ||
                other.original_title == original_title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.release_date, release_date) ||
                other.release_date == release_date) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    backdrop_path,
    origin_country,
    original_language,
    original_title,
    overview,
    release_date,
    status,
  );

  /// Create a copy of MovieDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailResponseImplCopyWith<_$MovieDetailResponseImpl> get copyWith =>
      __$$MovieDetailResponseImplCopyWithImpl<_$MovieDetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieDetailResponseImplToJson(this);
  }
}

abstract class _MovieDetailResponse implements MovieDetailResponse {
  const factory _MovieDetailResponse({
    final String? backdrop_path,
    final String? origin_country,
    final String? original_language,
    final String? original_title,
    final String? overview,
    final String? release_date,
    final String? status,
  }) = _$MovieDetailResponseImpl;

  factory _MovieDetailResponse.fromJson(Map<String, dynamic> json) =
      _$MovieDetailResponseImpl.fromJson;

  @override
  String? get backdrop_path;
  @override
  String? get origin_country;
  @override
  String? get original_language;
  @override
  String? get original_title;
  @override
  String? get overview;
  @override
  String? get release_date;
  @override
  String? get status;

  /// Create a copy of MovieDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieDetailResponseImplCopyWith<_$MovieDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
