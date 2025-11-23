// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LibraryMovieModel {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  bool? get watched => throw _privateConstructorUsedError;

  /// Create a copy of LibraryMovieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryMovieModelCopyWith<LibraryMovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryMovieModelCopyWith<$Res> {
  factory $LibraryMovieModelCopyWith(
    LibraryMovieModel value,
    $Res Function(LibraryMovieModel) then,
  ) = _$LibraryMovieModelCopyWithImpl<$Res, LibraryMovieModel>;
  @useResult
  $Res call({int id, String? title, String? posterPath, bool? watched});
}

/// @nodoc
class _$LibraryMovieModelCopyWithImpl<$Res, $Val extends LibraryMovieModel>
    implements $LibraryMovieModelCopyWith<$Res> {
  _$LibraryMovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryMovieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? watched = freezed,
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
            posterPath: freezed == posterPath
                ? _value.posterPath
                : posterPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            watched: freezed == watched
                ? _value.watched
                : watched // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LibraryMovieModelImplCopyWith<$Res>
    implements $LibraryMovieModelCopyWith<$Res> {
  factory _$$LibraryMovieModelImplCopyWith(
    _$LibraryMovieModelImpl value,
    $Res Function(_$LibraryMovieModelImpl) then,
  ) = __$$LibraryMovieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title, String? posterPath, bool? watched});
}

/// @nodoc
class __$$LibraryMovieModelImplCopyWithImpl<$Res>
    extends _$LibraryMovieModelCopyWithImpl<$Res, _$LibraryMovieModelImpl>
    implements _$$LibraryMovieModelImplCopyWith<$Res> {
  __$$LibraryMovieModelImplCopyWithImpl(
    _$LibraryMovieModelImpl _value,
    $Res Function(_$LibraryMovieModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryMovieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? posterPath = freezed,
    Object? watched = freezed,
  }) {
    return _then(
      _$LibraryMovieModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        posterPath: freezed == posterPath
            ? _value.posterPath
            : posterPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        watched: freezed == watched
            ? _value.watched
            : watched // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc

class _$LibraryMovieModelImpl implements _LibraryMovieModel {
  _$LibraryMovieModelImpl({
    required this.id,
    this.title,
    this.posterPath,
    this.watched,
  });

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? posterPath;
  @override
  final bool? watched;

  @override
  String toString() {
    return 'LibraryMovieModel(id: $id, title: $title, posterPath: $posterPath, watched: $watched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryMovieModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.watched, watched) || other.watched == watched));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, posterPath, watched);

  /// Create a copy of LibraryMovieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryMovieModelImplCopyWith<_$LibraryMovieModelImpl> get copyWith =>
      __$$LibraryMovieModelImplCopyWithImpl<_$LibraryMovieModelImpl>(
        this,
        _$identity,
      );
}

abstract class _LibraryMovieModel implements LibraryMovieModel {
  factory _LibraryMovieModel({
    required final int id,
    final String? title,
    final String? posterPath,
    final bool? watched,
  }) = _$LibraryMovieModelImpl;

  @override
  int get id;
  @override
  String? get title;
  @override
  String? get posterPath;
  @override
  bool? get watched;

  /// Create a copy of LibraryMovieModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryMovieModelImplCopyWith<_$LibraryMovieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
