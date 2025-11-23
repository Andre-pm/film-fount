// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WatchListEntity {
  List<LibraryMovieEntity>? get watchList => throw _privateConstructorUsedError;

  /// Create a copy of WatchListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchListEntityCopyWith<WatchListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchListEntityCopyWith<$Res> {
  factory $WatchListEntityCopyWith(
    WatchListEntity value,
    $Res Function(WatchListEntity) then,
  ) = _$WatchListEntityCopyWithImpl<$Res, WatchListEntity>;
  @useResult
  $Res call({List<LibraryMovieEntity>? watchList});
}

/// @nodoc
class _$WatchListEntityCopyWithImpl<$Res, $Val extends WatchListEntity>
    implements $WatchListEntityCopyWith<$Res> {
  _$WatchListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? watchList = freezed}) {
    return _then(
      _value.copyWith(
            watchList: freezed == watchList
                ? _value.watchList
                : watchList // ignore: cast_nullable_to_non_nullable
                      as List<LibraryMovieEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WatchListEntityImplCopyWith<$Res>
    implements $WatchListEntityCopyWith<$Res> {
  factory _$$WatchListEntityImplCopyWith(
    _$WatchListEntityImpl value,
    $Res Function(_$WatchListEntityImpl) then,
  ) = __$$WatchListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LibraryMovieEntity>? watchList});
}

/// @nodoc
class __$$WatchListEntityImplCopyWithImpl<$Res>
    extends _$WatchListEntityCopyWithImpl<$Res, _$WatchListEntityImpl>
    implements _$$WatchListEntityImplCopyWith<$Res> {
  __$$WatchListEntityImplCopyWithImpl(
    _$WatchListEntityImpl _value,
    $Res Function(_$WatchListEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WatchListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? watchList = freezed}) {
    return _then(
      _$WatchListEntityImpl(
        watchList: freezed == watchList
            ? _value._watchList
            : watchList // ignore: cast_nullable_to_non_nullable
                  as List<LibraryMovieEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$WatchListEntityImpl implements _WatchListEntity {
  _$WatchListEntityImpl({final List<LibraryMovieEntity>? watchList})
    : _watchList = watchList;

  final List<LibraryMovieEntity>? _watchList;
  @override
  List<LibraryMovieEntity>? get watchList {
    final value = _watchList;
    if (value == null) return null;
    if (_watchList is EqualUnmodifiableListView) return _watchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WatchListEntity(watchList: $watchList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchListEntityImpl &&
            const DeepCollectionEquality().equals(
              other._watchList,
              _watchList,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_watchList));

  /// Create a copy of WatchListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchListEntityImplCopyWith<_$WatchListEntityImpl> get copyWith =>
      __$$WatchListEntityImplCopyWithImpl<_$WatchListEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _WatchListEntity implements WatchListEntity {
  factory _WatchListEntity({final List<LibraryMovieEntity>? watchList}) =
      _$WatchListEntityImpl;

  @override
  List<LibraryMovieEntity>? get watchList;

  /// Create a copy of WatchListEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchListEntityImplCopyWith<_$WatchListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LibraryMovieEntity {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  bool? get watched => throw _privateConstructorUsedError;

  /// Create a copy of LibraryMovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LibraryMovieEntityCopyWith<LibraryMovieEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryMovieEntityCopyWith<$Res> {
  factory $LibraryMovieEntityCopyWith(
    LibraryMovieEntity value,
    $Res Function(LibraryMovieEntity) then,
  ) = _$LibraryMovieEntityCopyWithImpl<$Res, LibraryMovieEntity>;
  @useResult
  $Res call({int id, String? title, String? posterPath, bool? watched});
}

/// @nodoc
class _$LibraryMovieEntityCopyWithImpl<$Res, $Val extends LibraryMovieEntity>
    implements $LibraryMovieEntityCopyWith<$Res> {
  _$LibraryMovieEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LibraryMovieEntity
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
abstract class _$$LibraryMovieEntityImplCopyWith<$Res>
    implements $LibraryMovieEntityCopyWith<$Res> {
  factory _$$LibraryMovieEntityImplCopyWith(
    _$LibraryMovieEntityImpl value,
    $Res Function(_$LibraryMovieEntityImpl) then,
  ) = __$$LibraryMovieEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title, String? posterPath, bool? watched});
}

/// @nodoc
class __$$LibraryMovieEntityImplCopyWithImpl<$Res>
    extends _$LibraryMovieEntityCopyWithImpl<$Res, _$LibraryMovieEntityImpl>
    implements _$$LibraryMovieEntityImplCopyWith<$Res> {
  __$$LibraryMovieEntityImplCopyWithImpl(
    _$LibraryMovieEntityImpl _value,
    $Res Function(_$LibraryMovieEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LibraryMovieEntity
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
      _$LibraryMovieEntityImpl(
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

class _$LibraryMovieEntityImpl implements _LibraryMovieEntity {
  _$LibraryMovieEntityImpl({
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
    return 'LibraryMovieEntity(id: $id, title: $title, posterPath: $posterPath, watched: $watched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryMovieEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.watched, watched) || other.watched == watched));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, posterPath, watched);

  /// Create a copy of LibraryMovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryMovieEntityImplCopyWith<_$LibraryMovieEntityImpl> get copyWith =>
      __$$LibraryMovieEntityImplCopyWithImpl<_$LibraryMovieEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _LibraryMovieEntity implements LibraryMovieEntity {
  factory _LibraryMovieEntity({
    required final int id,
    final String? title,
    final String? posterPath,
    final bool? watched,
  }) = _$LibraryMovieEntityImpl;

  @override
  int get id;
  @override
  String? get title;
  @override
  String? get posterPath;
  @override
  bool? get watched;

  /// Create a copy of LibraryMovieEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryMovieEntityImplCopyWith<_$LibraryMovieEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
