// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GoalEntity {
  List<GoalItem>? get goals => throw _privateConstructorUsedError;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalEntityCopyWith<GoalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalEntityCopyWith<$Res> {
  factory $GoalEntityCopyWith(
    GoalEntity value,
    $Res Function(GoalEntity) then,
  ) = _$GoalEntityCopyWithImpl<$Res, GoalEntity>;
  @useResult
  $Res call({List<GoalItem>? goals});
}

/// @nodoc
class _$GoalEntityCopyWithImpl<$Res, $Val extends GoalEntity>
    implements $GoalEntityCopyWith<$Res> {
  _$GoalEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? goals = freezed}) {
    return _then(
      _value.copyWith(
            goals: freezed == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<GoalItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalEntityImplCopyWith<$Res>
    implements $GoalEntityCopyWith<$Res> {
  factory _$$GoalEntityImplCopyWith(
    _$GoalEntityImpl value,
    $Res Function(_$GoalEntityImpl) then,
  ) = __$$GoalEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GoalItem>? goals});
}

/// @nodoc
class __$$GoalEntityImplCopyWithImpl<$Res>
    extends _$GoalEntityCopyWithImpl<$Res, _$GoalEntityImpl>
    implements _$$GoalEntityImplCopyWith<$Res> {
  __$$GoalEntityImplCopyWithImpl(
    _$GoalEntityImpl _value,
    $Res Function(_$GoalEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? goals = freezed}) {
    return _then(
      _$GoalEntityImpl(
        goals: freezed == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<GoalItem>?,
      ),
    );
  }
}

/// @nodoc

class _$GoalEntityImpl implements _GoalEntity {
  _$GoalEntityImpl({final List<GoalItem>? goals}) : _goals = goals;

  final List<GoalItem>? _goals;
  @override
  List<GoalItem>? get goals {
    final value = _goals;
    if (value == null) return null;
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GoalEntity(goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalEntityImpl &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalEntityImplCopyWith<_$GoalEntityImpl> get copyWith =>
      __$$GoalEntityImplCopyWithImpl<_$GoalEntityImpl>(this, _$identity);
}

abstract class _GoalEntity implements GoalEntity {
  factory _GoalEntity({final List<GoalItem>? goals}) = _$GoalEntityImpl;

  @override
  List<GoalItem>? get goals;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalEntityImplCopyWith<_$GoalEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GoalItem {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get daysTarget => throw _privateConstructorUsedError;
  DateTime? get initialDate => throw _privateConstructorUsedError;
  DateTime? get conclusionDate => throw _privateConstructorUsedError;
  List<LibraryMovieEntity>? get movies => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  /// Create a copy of GoalItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalItemCopyWith<GoalItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalItemCopyWith<$Res> {
  factory $GoalItemCopyWith(GoalItem value, $Res Function(GoalItem) then) =
      _$GoalItemCopyWithImpl<$Res, GoalItem>;
  @useResult
  $Res call({
    int id,
    String? title,
    int? daysTarget,
    DateTime? initialDate,
    DateTime? conclusionDate,
    List<LibraryMovieEntity>? movies,
    bool? completed,
  });
}

/// @nodoc
class _$GoalItemCopyWithImpl<$Res, $Val extends GoalItem>
    implements $GoalItemCopyWith<$Res> {
  _$GoalItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? daysTarget = freezed,
    Object? initialDate = freezed,
    Object? conclusionDate = freezed,
    Object? movies = freezed,
    Object? completed = freezed,
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
            daysTarget: freezed == daysTarget
                ? _value.daysTarget
                : daysTarget // ignore: cast_nullable_to_non_nullable
                      as int?,
            initialDate: freezed == initialDate
                ? _value.initialDate
                : initialDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            conclusionDate: freezed == conclusionDate
                ? _value.conclusionDate
                : conclusionDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            movies: freezed == movies
                ? _value.movies
                : movies // ignore: cast_nullable_to_non_nullable
                      as List<LibraryMovieEntity>?,
            completed: freezed == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalItemImplCopyWith<$Res>
    implements $GoalItemCopyWith<$Res> {
  factory _$$GoalItemImplCopyWith(
    _$GoalItemImpl value,
    $Res Function(_$GoalItemImpl) then,
  ) = __$$GoalItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? title,
    int? daysTarget,
    DateTime? initialDate,
    DateTime? conclusionDate,
    List<LibraryMovieEntity>? movies,
    bool? completed,
  });
}

/// @nodoc
class __$$GoalItemImplCopyWithImpl<$Res>
    extends _$GoalItemCopyWithImpl<$Res, _$GoalItemImpl>
    implements _$$GoalItemImplCopyWith<$Res> {
  __$$GoalItemImplCopyWithImpl(
    _$GoalItemImpl _value,
    $Res Function(_$GoalItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? daysTarget = freezed,
    Object? initialDate = freezed,
    Object? conclusionDate = freezed,
    Object? movies = freezed,
    Object? completed = freezed,
  }) {
    return _then(
      _$GoalItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        daysTarget: freezed == daysTarget
            ? _value.daysTarget
            : daysTarget // ignore: cast_nullable_to_non_nullable
                  as int?,
        initialDate: freezed == initialDate
            ? _value.initialDate
            : initialDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        conclusionDate: freezed == conclusionDate
            ? _value.conclusionDate
            : conclusionDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        movies: freezed == movies
            ? _value._movies
            : movies // ignore: cast_nullable_to_non_nullable
                  as List<LibraryMovieEntity>?,
        completed: freezed == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc

class _$GoalItemImpl implements _GoalItem {
  _$GoalItemImpl({
    required this.id,
    this.title,
    this.daysTarget,
    this.initialDate,
    this.conclusionDate,
    final List<LibraryMovieEntity>? movies,
    this.completed,
  }) : _movies = movies;

  @override
  final int id;
  @override
  final String? title;
  @override
  final int? daysTarget;
  @override
  final DateTime? initialDate;
  @override
  final DateTime? conclusionDate;
  final List<LibraryMovieEntity>? _movies;
  @override
  List<LibraryMovieEntity>? get movies {
    final value = _movies;
    if (value == null) return null;
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? completed;

  @override
  String toString() {
    return 'GoalItem(id: $id, title: $title, daysTarget: $daysTarget, initialDate: $initialDate, conclusionDate: $conclusionDate, movies: $movies, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.daysTarget, daysTarget) ||
                other.daysTarget == daysTarget) &&
            (identical(other.initialDate, initialDate) ||
                other.initialDate == initialDate) &&
            (identical(other.conclusionDate, conclusionDate) ||
                other.conclusionDate == conclusionDate) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    daysTarget,
    initialDate,
    conclusionDate,
    const DeepCollectionEquality().hash(_movies),
    completed,
  );

  /// Create a copy of GoalItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalItemImplCopyWith<_$GoalItemImpl> get copyWith =>
      __$$GoalItemImplCopyWithImpl<_$GoalItemImpl>(this, _$identity);
}

abstract class _GoalItem implements GoalItem {
  factory _GoalItem({
    required final int id,
    final String? title,
    final int? daysTarget,
    final DateTime? initialDate,
    final DateTime? conclusionDate,
    final List<LibraryMovieEntity>? movies,
    final bool? completed,
  }) = _$GoalItemImpl;

  @override
  int get id;
  @override
  String? get title;
  @override
  int? get daysTarget;
  @override
  DateTime? get initialDate;
  @override
  DateTime? get conclusionDate;
  @override
  List<LibraryMovieEntity>? get movies;
  @override
  bool? get completed;

  /// Create a copy of GoalItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalItemImplCopyWith<_$GoalItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
