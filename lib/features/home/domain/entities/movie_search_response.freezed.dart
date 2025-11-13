// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MovieSearchResponse _$MovieSearchResponseFromJson(Map<String, dynamic> json) {
  return _MovieSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieSearchResponse {
  List<MovieItemResponse> get results => throw _privateConstructorUsedError;

  /// Serializes this MovieSearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieSearchResponseCopyWith<MovieSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieSearchResponseCopyWith<$Res> {
  factory $MovieSearchResponseCopyWith(
    MovieSearchResponse value,
    $Res Function(MovieSearchResponse) then,
  ) = _$MovieSearchResponseCopyWithImpl<$Res, MovieSearchResponse>;
  @useResult
  $Res call({List<MovieItemResponse> results});
}

/// @nodoc
class _$MovieSearchResponseCopyWithImpl<$Res, $Val extends MovieSearchResponse>
    implements $MovieSearchResponseCopyWith<$Res> {
  _$MovieSearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null}) {
    return _then(
      _value.copyWith(
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<MovieItemResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieSearchResponseImplCopyWith<$Res>
    implements $MovieSearchResponseCopyWith<$Res> {
  factory _$$MovieSearchResponseImplCopyWith(
    _$MovieSearchResponseImpl value,
    $Res Function(_$MovieSearchResponseImpl) then,
  ) = __$$MovieSearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieItemResponse> results});
}

/// @nodoc
class __$$MovieSearchResponseImplCopyWithImpl<$Res>
    extends _$MovieSearchResponseCopyWithImpl<$Res, _$MovieSearchResponseImpl>
    implements _$$MovieSearchResponseImplCopyWith<$Res> {
  __$$MovieSearchResponseImplCopyWithImpl(
    _$MovieSearchResponseImpl _value,
    $Res Function(_$MovieSearchResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null}) {
    return _then(
      _$MovieSearchResponseImpl(
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<MovieItemResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieSearchResponseImpl implements _MovieSearchResponse {
  const _$MovieSearchResponseImpl({
    required final List<MovieItemResponse> results,
  }) : _results = results;

  factory _$MovieSearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieSearchResponseImplFromJson(json);

  final List<MovieItemResponse> _results;
  @override
  List<MovieItemResponse> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MovieSearchResponse(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieSearchResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of MovieSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieSearchResponseImplCopyWith<_$MovieSearchResponseImpl> get copyWith =>
      __$$MovieSearchResponseImplCopyWithImpl<_$MovieSearchResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieSearchResponseImplToJson(this);
  }
}

abstract class _MovieSearchResponse implements MovieSearchResponse {
  const factory _MovieSearchResponse({
    required final List<MovieItemResponse> results,
  }) = _$MovieSearchResponseImpl;

  factory _MovieSearchResponse.fromJson(Map<String, dynamic> json) =
      _$MovieSearchResponseImpl.fromJson;

  @override
  List<MovieItemResponse> get results;

  /// Create a copy of MovieSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieSearchResponseImplCopyWith<_$MovieSearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieItemResponse _$MovieItemResponseFromJson(Map<String, dynamic> json) {
  return _MovieItemResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieItemResponse {
  int get id => throw _privateConstructorUsedError;
  String? get original_language => throw _privateConstructorUsedError;
  String? get original_title => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  String? get poster_path => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this MovieItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieItemResponseCopyWith<MovieItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieItemResponseCopyWith<$Res> {
  factory $MovieItemResponseCopyWith(
    MovieItemResponse value,
    $Res Function(MovieItemResponse) then,
  ) = _$MovieItemResponseCopyWithImpl<$Res, MovieItemResponse>;
  @useResult
  $Res call({
    int id,
    String? original_language,
    String? original_title,
    String? overview,
    String? poster_path,
    String? title,
  });
}

/// @nodoc
class _$MovieItemResponseCopyWithImpl<$Res, $Val extends MovieItemResponse>
    implements $MovieItemResponseCopyWith<$Res> {
  _$MovieItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? original_language = freezed,
    Object? original_title = freezed,
    Object? overview = freezed,
    Object? poster_path = freezed,
    Object? title = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
            poster_path: freezed == poster_path
                ? _value.poster_path
                : poster_path // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieItemResponseImplCopyWith<$Res>
    implements $MovieItemResponseCopyWith<$Res> {
  factory _$$MovieItemResponseImplCopyWith(
    _$MovieItemResponseImpl value,
    $Res Function(_$MovieItemResponseImpl) then,
  ) = __$$MovieItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? original_language,
    String? original_title,
    String? overview,
    String? poster_path,
    String? title,
  });
}

/// @nodoc
class __$$MovieItemResponseImplCopyWithImpl<$Res>
    extends _$MovieItemResponseCopyWithImpl<$Res, _$MovieItemResponseImpl>
    implements _$$MovieItemResponseImplCopyWith<$Res> {
  __$$MovieItemResponseImplCopyWithImpl(
    _$MovieItemResponseImpl _value,
    $Res Function(_$MovieItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? original_language = freezed,
    Object? original_title = freezed,
    Object? overview = freezed,
    Object? poster_path = freezed,
    Object? title = freezed,
  }) {
    return _then(
      _$MovieItemResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
        poster_path: freezed == poster_path
            ? _value.poster_path
            : poster_path // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieItemResponseImpl implements _MovieItemResponse {
  const _$MovieItemResponseImpl({
    required this.id,
    this.original_language,
    this.original_title,
    this.overview,
    this.poster_path,
    this.title,
  });

  factory _$MovieItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieItemResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String? original_language;
  @override
  final String? original_title;
  @override
  final String? overview;
  @override
  final String? poster_path;
  @override
  final String? title;

  @override
  String toString() {
    return 'MovieItemResponse(id: $id, original_language: $original_language, original_title: $original_title, overview: $overview, poster_path: $poster_path, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.original_language, original_language) ||
                other.original_language == original_language) &&
            (identical(other.original_title, original_title) ||
                other.original_title == original_title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.poster_path, poster_path) ||
                other.poster_path == poster_path) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    original_language,
    original_title,
    overview,
    poster_path,
    title,
  );

  /// Create a copy of MovieItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieItemResponseImplCopyWith<_$MovieItemResponseImpl> get copyWith =>
      __$$MovieItemResponseImplCopyWithImpl<_$MovieItemResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieItemResponseImplToJson(this);
  }
}

abstract class _MovieItemResponse implements MovieItemResponse {
  const factory _MovieItemResponse({
    required final int id,
    final String? original_language,
    final String? original_title,
    final String? overview,
    final String? poster_path,
    final String? title,
  }) = _$MovieItemResponseImpl;

  factory _MovieItemResponse.fromJson(Map<String, dynamic> json) =
      _$MovieItemResponseImpl.fromJson;

  @override
  int get id;
  @override
  String? get original_language;
  @override
  String? get original_title;
  @override
  String? get overview;
  @override
  String? get poster_path;
  @override
  String? get title;

  /// Create a copy of MovieItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieItemResponseImplCopyWith<_$MovieItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
