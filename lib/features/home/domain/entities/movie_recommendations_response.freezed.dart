// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_recommendations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MovieRecommendationsResponse _$MovieRecommendationsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MovieRecommendationsResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieRecommendationsResponse {
  int get page => throw _privateConstructorUsedError;
  int get total_pages => throw _privateConstructorUsedError;
  int get total_results => throw _privateConstructorUsedError;
  List<RecommendationsResponse> get results =>
      throw _privateConstructorUsedError;

  /// Serializes this MovieRecommendationsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieRecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieRecommendationsResponseCopyWith<MovieRecommendationsResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieRecommendationsResponseCopyWith<$Res> {
  factory $MovieRecommendationsResponseCopyWith(
    MovieRecommendationsResponse value,
    $Res Function(MovieRecommendationsResponse) then,
  ) =
      _$MovieRecommendationsResponseCopyWithImpl<
        $Res,
        MovieRecommendationsResponse
      >;
  @useResult
  $Res call({
    int page,
    int total_pages,
    int total_results,
    List<RecommendationsResponse> results,
  });
}

/// @nodoc
class _$MovieRecommendationsResponseCopyWithImpl<
  $Res,
  $Val extends MovieRecommendationsResponse
>
    implements $MovieRecommendationsResponseCopyWith<$Res> {
  _$MovieRecommendationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieRecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? total_pages = null,
    Object? total_results = null,
    Object? results = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            total_pages: null == total_pages
                ? _value.total_pages
                : total_pages // ignore: cast_nullable_to_non_nullable
                      as int,
            total_results: null == total_results
                ? _value.total_results
                : total_results // ignore: cast_nullable_to_non_nullable
                      as int,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<RecommendationsResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieRecommendationsResponseImplCopyWith<$Res>
    implements $MovieRecommendationsResponseCopyWith<$Res> {
  factory _$$MovieRecommendationsResponseImplCopyWith(
    _$MovieRecommendationsResponseImpl value,
    $Res Function(_$MovieRecommendationsResponseImpl) then,
  ) = __$$MovieRecommendationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    int total_pages,
    int total_results,
    List<RecommendationsResponse> results,
  });
}

/// @nodoc
class __$$MovieRecommendationsResponseImplCopyWithImpl<$Res>
    extends
        _$MovieRecommendationsResponseCopyWithImpl<
          $Res,
          _$MovieRecommendationsResponseImpl
        >
    implements _$$MovieRecommendationsResponseImplCopyWith<$Res> {
  __$$MovieRecommendationsResponseImplCopyWithImpl(
    _$MovieRecommendationsResponseImpl _value,
    $Res Function(_$MovieRecommendationsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieRecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? total_pages = null,
    Object? total_results = null,
    Object? results = null,
  }) {
    return _then(
      _$MovieRecommendationsResponseImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        total_pages: null == total_pages
            ? _value.total_pages
            : total_pages // ignore: cast_nullable_to_non_nullable
                  as int,
        total_results: null == total_results
            ? _value.total_results
            : total_results // ignore: cast_nullable_to_non_nullable
                  as int,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<RecommendationsResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieRecommendationsResponseImpl
    implements _MovieRecommendationsResponse {
  const _$MovieRecommendationsResponseImpl({
    required this.page,
    required this.total_pages,
    required this.total_results,
    required final List<RecommendationsResponse> results,
  }) : _results = results;

  factory _$MovieRecommendationsResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$MovieRecommendationsResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int total_pages;
  @override
  final int total_results;
  final List<RecommendationsResponse> _results;
  @override
  List<RecommendationsResponse> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MovieRecommendationsResponse(page: $page, total_pages: $total_pages, total_results: $total_results, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieRecommendationsResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total_pages, total_pages) ||
                other.total_pages == total_pages) &&
            (identical(other.total_results, total_results) ||
                other.total_results == total_results) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    total_pages,
    total_results,
    const DeepCollectionEquality().hash(_results),
  );

  /// Create a copy of MovieRecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieRecommendationsResponseImplCopyWith<
    _$MovieRecommendationsResponseImpl
  >
  get copyWith =>
      __$$MovieRecommendationsResponseImplCopyWithImpl<
        _$MovieRecommendationsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieRecommendationsResponseImplToJson(this);
  }
}

abstract class _MovieRecommendationsResponse
    implements MovieRecommendationsResponse {
  const factory _MovieRecommendationsResponse({
    required final int page,
    required final int total_pages,
    required final int total_results,
    required final List<RecommendationsResponse> results,
  }) = _$MovieRecommendationsResponseImpl;

  factory _MovieRecommendationsResponse.fromJson(Map<String, dynamic> json) =
      _$MovieRecommendationsResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get total_pages;
  @override
  int get total_results;
  @override
  List<RecommendationsResponse> get results;

  /// Create a copy of MovieRecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieRecommendationsResponseImplCopyWith<
    _$MovieRecommendationsResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

RecommendationsResponse _$RecommendationsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendationsResponse.fromJson(json);
}

/// @nodoc
mixin _$RecommendationsResponse {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get original_title => throw _privateConstructorUsedError;
  String? get poster_path => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;

  /// Serializes this RecommendationsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationsResponseCopyWith<RecommendationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationsResponseCopyWith<$Res> {
  factory $RecommendationsResponseCopyWith(
    RecommendationsResponse value,
    $Res Function(RecommendationsResponse) then,
  ) = _$RecommendationsResponseCopyWithImpl<$Res, RecommendationsResponse>;
  @useResult
  $Res call({
    int id,
    String? title,
    String? original_title,
    String? poster_path,
    String? overview,
  });
}

/// @nodoc
class _$RecommendationsResponseCopyWithImpl<
  $Res,
  $Val extends RecommendationsResponse
>
    implements $RecommendationsResponseCopyWith<$Res> {
  _$RecommendationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? original_title = freezed,
    Object? poster_path = freezed,
    Object? overview = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            original_title: freezed == original_title
                ? _value.original_title
                : original_title // ignore: cast_nullable_to_non_nullable
                      as String?,
            poster_path: freezed == poster_path
                ? _value.poster_path
                : poster_path // ignore: cast_nullable_to_non_nullable
                      as String?,
            overview: freezed == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendationsResponseImplCopyWith<$Res>
    implements $RecommendationsResponseCopyWith<$Res> {
  factory _$$RecommendationsResponseImplCopyWith(
    _$RecommendationsResponseImpl value,
    $Res Function(_$RecommendationsResponseImpl) then,
  ) = __$$RecommendationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? title,
    String? original_title,
    String? poster_path,
    String? overview,
  });
}

/// @nodoc
class __$$RecommendationsResponseImplCopyWithImpl<$Res>
    extends
        _$RecommendationsResponseCopyWithImpl<
          $Res,
          _$RecommendationsResponseImpl
        >
    implements _$$RecommendationsResponseImplCopyWith<$Res> {
  __$$RecommendationsResponseImplCopyWithImpl(
    _$RecommendationsResponseImpl _value,
    $Res Function(_$RecommendationsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? original_title = freezed,
    Object? poster_path = freezed,
    Object? overview = freezed,
  }) {
    return _then(
      _$RecommendationsResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        original_title: freezed == original_title
            ? _value.original_title
            : original_title // ignore: cast_nullable_to_non_nullable
                  as String?,
        poster_path: freezed == poster_path
            ? _value.poster_path
            : poster_path // ignore: cast_nullable_to_non_nullable
                  as String?,
        overview: freezed == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationsResponseImpl implements _RecommendationsResponse {
  const _$RecommendationsResponseImpl({
    required this.id,
    this.title,
    this.original_title,
    this.poster_path,
    this.overview,
  });

  factory _$RecommendationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationsResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? original_title;
  @override
  final String? poster_path;
  @override
  final String? overview;

  @override
  String toString() {
    return 'RecommendationsResponse(id: $id, title: $title, original_title: $original_title, poster_path: $poster_path, overview: $overview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationsResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.original_title, original_title) ||
                other.original_title == original_title) &&
            (identical(other.poster_path, poster_path) ||
                other.poster_path == poster_path) &&
            (identical(other.overview, overview) ||
                other.overview == overview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    original_title,
    poster_path,
    overview,
  );

  /// Create a copy of RecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationsResponseImplCopyWith<_$RecommendationsResponseImpl>
  get copyWith =>
      __$$RecommendationsResponseImplCopyWithImpl<
        _$RecommendationsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationsResponseImplToJson(this);
  }
}

abstract class _RecommendationsResponse implements RecommendationsResponse {
  const factory _RecommendationsResponse({
    required final int id,
    final String? title,
    final String? original_title,
    final String? poster_path,
    final String? overview,
  }) = _$RecommendationsResponseImpl;

  factory _RecommendationsResponse.fromJson(Map<String, dynamic> json) =
      _$RecommendationsResponseImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  String? get original_title;
  @override
  String? get poster_path;
  @override
  String? get overview;

  /// Create a copy of RecommendationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationsResponseImplCopyWith<_$RecommendationsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
