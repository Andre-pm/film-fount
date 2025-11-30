// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MovieDetailEntity {
  int get id => throw _privateConstructorUsedError;
  String? get originalLanguage => throw _privateConstructorUsedError;
  String? get originalTitle => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get backdropPath => throw _privateConstructorUsedError;
  List<String>? get genres => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool get isInWatchList => throw _privateConstructorUsedError;
  List<MovieEntity>? get similarMovies => throw _privateConstructorUsedError;
  List<MovieEntity>? get recommendations => throw _privateConstructorUsedError;

  /// Create a copy of MovieDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieDetailEntityCopyWith<MovieDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailEntityCopyWith<$Res> {
  factory $MovieDetailEntityCopyWith(
    MovieDetailEntity value,
    $Res Function(MovieDetailEntity) then,
  ) = _$MovieDetailEntityCopyWithImpl<$Res, MovieDetailEntity>;
  @useResult
  $Res call({
    int id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? title,
    String? backdropPath,
    List<String>? genres,
    String? homepage,
    String? releaseDate,
    String? status,
    bool isInWatchList,
    List<MovieEntity>? similarMovies,
    List<MovieEntity>? recommendations,
  });
}

/// @nodoc
class _$MovieDetailEntityCopyWithImpl<$Res, $Val extends MovieDetailEntity>
    implements $MovieDetailEntityCopyWith<$Res> {
  _$MovieDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? title = freezed,
    Object? backdropPath = freezed,
    Object? genres = freezed,
    Object? homepage = freezed,
    Object? releaseDate = freezed,
    Object? status = freezed,
    Object? isInWatchList = null,
    Object? similarMovies = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            originalLanguage: freezed == originalLanguage
                ? _value.originalLanguage
                : originalLanguage // ignore: cast_nullable_to_non_nullable
                      as String?,
            originalTitle: freezed == originalTitle
                ? _value.originalTitle
                : originalTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            overview: freezed == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String?,
            posterPath: freezed == posterPath
                ? _value.posterPath
                : posterPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            backdropPath: freezed == backdropPath
                ? _value.backdropPath
                : backdropPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            genres: freezed == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            homepage: freezed == homepage
                ? _value.homepage
                : homepage // ignore: cast_nullable_to_non_nullable
                      as String?,
            releaseDate: freezed == releaseDate
                ? _value.releaseDate
                : releaseDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            isInWatchList: null == isInWatchList
                ? _value.isInWatchList
                : isInWatchList // ignore: cast_nullable_to_non_nullable
                      as bool,
            similarMovies: freezed == similarMovies
                ? _value.similarMovies
                : similarMovies // ignore: cast_nullable_to_non_nullable
                      as List<MovieEntity>?,
            recommendations: freezed == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<MovieEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieDetailEntityImplCopyWith<$Res>
    implements $MovieDetailEntityCopyWith<$Res> {
  factory _$$MovieDetailEntityImplCopyWith(
    _$MovieDetailEntityImpl value,
    $Res Function(_$MovieDetailEntityImpl) then,
  ) = __$$MovieDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? title,
    String? backdropPath,
    List<String>? genres,
    String? homepage,
    String? releaseDate,
    String? status,
    bool isInWatchList,
    List<MovieEntity>? similarMovies,
    List<MovieEntity>? recommendations,
  });
}

/// @nodoc
class __$$MovieDetailEntityImplCopyWithImpl<$Res>
    extends _$MovieDetailEntityCopyWithImpl<$Res, _$MovieDetailEntityImpl>
    implements _$$MovieDetailEntityImplCopyWith<$Res> {
  __$$MovieDetailEntityImplCopyWithImpl(
    _$MovieDetailEntityImpl _value,
    $Res Function(_$MovieDetailEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? title = freezed,
    Object? backdropPath = freezed,
    Object? genres = freezed,
    Object? homepage = freezed,
    Object? releaseDate = freezed,
    Object? status = freezed,
    Object? isInWatchList = null,
    Object? similarMovies = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(
      _$MovieDetailEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        originalLanguage: freezed == originalLanguage
            ? _value.originalLanguage
            : originalLanguage // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalTitle: freezed == originalTitle
            ? _value.originalTitle
            : originalTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        overview: freezed == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String?,
        posterPath: freezed == posterPath
            ? _value.posterPath
            : posterPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        backdropPath: freezed == backdropPath
            ? _value.backdropPath
            : backdropPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        genres: freezed == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        homepage: freezed == homepage
            ? _value.homepage
            : homepage // ignore: cast_nullable_to_non_nullable
                  as String?,
        releaseDate: freezed == releaseDate
            ? _value.releaseDate
            : releaseDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        isInWatchList: null == isInWatchList
            ? _value.isInWatchList
            : isInWatchList // ignore: cast_nullable_to_non_nullable
                  as bool,
        similarMovies: freezed == similarMovies
            ? _value._similarMovies
            : similarMovies // ignore: cast_nullable_to_non_nullable
                  as List<MovieEntity>?,
        recommendations: freezed == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<MovieEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$MovieDetailEntityImpl implements _MovieDetailEntity {
  const _$MovieDetailEntityImpl({
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
    this.backdropPath,
    final List<String>? genres,
    this.homepage,
    this.releaseDate,
    this.status,
    this.isInWatchList = false,
    final List<MovieEntity>? similarMovies,
    final List<MovieEntity>? recommendations,
  }) : _genres = genres,
       _similarMovies = similarMovies,
       _recommendations = recommendations;

  @override
  final int id;
  @override
  final String? originalLanguage;
  @override
  final String? originalTitle;
  @override
  final String? overview;
  @override
  final String? posterPath;
  @override
  final String? title;
  @override
  final String? backdropPath;
  final List<String>? _genres;
  @override
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? homepage;
  @override
  final String? releaseDate;
  @override
  final String? status;
  @override
  @JsonKey()
  final bool isInWatchList;
  final List<MovieEntity>? _similarMovies;
  @override
  List<MovieEntity>? get similarMovies {
    final value = _similarMovies;
    if (value == null) return null;
    if (_similarMovies is EqualUnmodifiableListView) return _similarMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MovieEntity>? _recommendations;
  @override
  List<MovieEntity>? get recommendations {
    final value = _recommendations;
    if (value == null) return null;
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovieDetailEntity(id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, title: $title, backdropPath: $backdropPath, genres: $genres, homepage: $homepage, releaseDate: $releaseDate, status: $status, isInWatchList: $isInWatchList, similarMovies: $similarMovies, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isInWatchList, isInWatchList) ||
                other.isInWatchList == isInWatchList) &&
            const DeepCollectionEquality().equals(
              other._similarMovies,
              _similarMovies,
            ) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    originalLanguage,
    originalTitle,
    overview,
    posterPath,
    title,
    backdropPath,
    const DeepCollectionEquality().hash(_genres),
    homepage,
    releaseDate,
    status,
    isInWatchList,
    const DeepCollectionEquality().hash(_similarMovies),
    const DeepCollectionEquality().hash(_recommendations),
  );

  /// Create a copy of MovieDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailEntityImplCopyWith<_$MovieDetailEntityImpl> get copyWith =>
      __$$MovieDetailEntityImplCopyWithImpl<_$MovieDetailEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _MovieDetailEntity implements MovieDetailEntity {
  const factory _MovieDetailEntity({
    required final int id,
    final String? originalLanguage,
    final String? originalTitle,
    final String? overview,
    final String? posterPath,
    final String? title,
    final String? backdropPath,
    final List<String>? genres,
    final String? homepage,
    final String? releaseDate,
    final String? status,
    final bool isInWatchList,
    final List<MovieEntity>? similarMovies,
    final List<MovieEntity>? recommendations,
  }) = _$MovieDetailEntityImpl;

  @override
  int get id;
  @override
  String? get originalLanguage;
  @override
  String? get originalTitle;
  @override
  String? get overview;
  @override
  String? get posterPath;
  @override
  String? get title;
  @override
  String? get backdropPath;
  @override
  List<String>? get genres;
  @override
  String? get homepage;
  @override
  String? get releaseDate;
  @override
  String? get status;
  @override
  bool get isInWatchList;
  @override
  List<MovieEntity>? get similarMovies;
  @override
  List<MovieEntity>? get recommendations;

  /// Create a copy of MovieDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieDetailEntityImplCopyWith<_$MovieDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
