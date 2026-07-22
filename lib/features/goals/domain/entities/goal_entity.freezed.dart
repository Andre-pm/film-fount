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
mixin _$GoalListEntity {
  List<GoalEntity> get goals => throw _privateConstructorUsedError;

  /// Create a copy of GoalListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalListEntityCopyWith<GoalListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalListEntityCopyWith<$Res> {
  factory $GoalListEntityCopyWith(
    GoalListEntity value,
    $Res Function(GoalListEntity) then,
  ) = _$GoalListEntityCopyWithImpl<$Res, GoalListEntity>;
  @useResult
  $Res call({List<GoalEntity> goals});
}

/// @nodoc
class _$GoalListEntityCopyWithImpl<$Res, $Val extends GoalListEntity>
    implements $GoalListEntityCopyWith<$Res> {
  _$GoalListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? goals = null}) {
    return _then(
      _value.copyWith(
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<GoalEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalListEntityImplCopyWith<$Res>
    implements $GoalListEntityCopyWith<$Res> {
  factory _$$GoalListEntityImplCopyWith(
    _$GoalListEntityImpl value,
    $Res Function(_$GoalListEntityImpl) then,
  ) = __$$GoalListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GoalEntity> goals});
}

/// @nodoc
class __$$GoalListEntityImplCopyWithImpl<$Res>
    extends _$GoalListEntityCopyWithImpl<$Res, _$GoalListEntityImpl>
    implements _$$GoalListEntityImplCopyWith<$Res> {
  __$$GoalListEntityImplCopyWithImpl(
    _$GoalListEntityImpl _value,
    $Res Function(_$GoalListEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? goals = null}) {
    return _then(
      _$GoalListEntityImpl(
        goals: null == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<GoalEntity>,
      ),
    );
  }
}

/// @nodoc

class _$GoalListEntityImpl implements _GoalListEntity {
  const _$GoalListEntityImpl({final List<GoalEntity> goals = const []})
    : _goals = goals;

  final List<GoalEntity> _goals;
  @override
  @JsonKey()
  List<GoalEntity> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  String toString() {
    return 'GoalListEntity(goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalListEntityImpl &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

  /// Create a copy of GoalListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalListEntityImplCopyWith<_$GoalListEntityImpl> get copyWith =>
      __$$GoalListEntityImplCopyWithImpl<_$GoalListEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _GoalListEntity implements GoalListEntity {
  const factory _GoalListEntity({final List<GoalEntity> goals}) =
      _$GoalListEntityImpl;

  @override
  List<GoalEntity> get goals;

  /// Create a copy of GoalListEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalListEntityImplCopyWith<_$GoalListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GoalEntity {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  List<MovieEntity> get movies => throw _privateConstructorUsedError;
  int get qtdMoviesWatchedInGoal => throw _privateConstructorUsedError;
  double? get goalPercentage => throw _privateConstructorUsedError;
  String? get goalMessage => throw _privateConstructorUsedError;
  String? get deadLineMessage => throw _privateConstructorUsedError;

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
  $Res call({
    String title,
    String? description,
    DateTime createdAt,
    DateTime deadline,
    bool isCompleted,
    bool isPublic,
    String? userName,
    List<MovieEntity> movies,
    int qtdMoviesWatchedInGoal,
    double? goalPercentage,
    String? goalMessage,
    String? deadLineMessage,
  });
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
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? deadline = null,
    Object? isCompleted = null,
    Object? isPublic = null,
    Object? userName = freezed,
    Object? movies = null,
    Object? qtdMoviesWatchedInGoal = null,
    Object? goalPercentage = freezed,
    Object? goalMessage = freezed,
    Object? deadLineMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            deadline: null == deadline
                ? _value.deadline
                : deadline // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPublic: null == isPublic
                ? _value.isPublic
                : isPublic // ignore: cast_nullable_to_non_nullable
                      as bool,
            userName: freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String?,
            movies: null == movies
                ? _value.movies
                : movies // ignore: cast_nullable_to_non_nullable
                      as List<MovieEntity>,
            qtdMoviesWatchedInGoal: null == qtdMoviesWatchedInGoal
                ? _value.qtdMoviesWatchedInGoal
                : qtdMoviesWatchedInGoal // ignore: cast_nullable_to_non_nullable
                      as int,
            goalPercentage: freezed == goalPercentage
                ? _value.goalPercentage
                : goalPercentage // ignore: cast_nullable_to_non_nullable
                      as double?,
            goalMessage: freezed == goalMessage
                ? _value.goalMessage
                : goalMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            deadLineMessage: freezed == deadLineMessage
                ? _value.deadLineMessage
                : deadLineMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
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
  $Res call({
    String title,
    String? description,
    DateTime createdAt,
    DateTime deadline,
    bool isCompleted,
    bool isPublic,
    String? userName,
    List<MovieEntity> movies,
    int qtdMoviesWatchedInGoal,
    double? goalPercentage,
    String? goalMessage,
    String? deadLineMessage,
  });
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
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? deadline = null,
    Object? isCompleted = null,
    Object? isPublic = null,
    Object? userName = freezed,
    Object? movies = null,
    Object? qtdMoviesWatchedInGoal = null,
    Object? goalPercentage = freezed,
    Object? goalMessage = freezed,
    Object? deadLineMessage = freezed,
  }) {
    return _then(
      _$GoalEntityImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        deadline: null == deadline
            ? _value.deadline
            : deadline // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPublic: null == isPublic
            ? _value.isPublic
            : isPublic // ignore: cast_nullable_to_non_nullable
                  as bool,
        userName: freezed == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String?,
        movies: null == movies
            ? _value._movies
            : movies // ignore: cast_nullable_to_non_nullable
                  as List<MovieEntity>,
        qtdMoviesWatchedInGoal: null == qtdMoviesWatchedInGoal
            ? _value.qtdMoviesWatchedInGoal
            : qtdMoviesWatchedInGoal // ignore: cast_nullable_to_non_nullable
                  as int,
        goalPercentage: freezed == goalPercentage
            ? _value.goalPercentage
            : goalPercentage // ignore: cast_nullable_to_non_nullable
                  as double?,
        goalMessage: freezed == goalMessage
            ? _value.goalMessage
            : goalMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        deadLineMessage: freezed == deadLineMessage
            ? _value.deadLineMessage
            : deadLineMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$GoalEntityImpl implements _GoalEntity {
  const _$GoalEntityImpl({
    required this.title,
    this.description,
    required this.createdAt,
    required this.deadline,
    this.isCompleted = false,
    this.isPublic = false,
    this.userName,
    final List<MovieEntity> movies = const [],
    this.qtdMoviesWatchedInGoal = 0,
    this.goalPercentage,
    this.goalMessage,
    this.deadLineMessage,
  }) : _movies = movies;

  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime deadline;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isPublic;
  @override
  final String? userName;
  final List<MovieEntity> _movies;
  @override
  @JsonKey()
  List<MovieEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final int qtdMoviesWatchedInGoal;
  @override
  final double? goalPercentage;
  @override
  final String? goalMessage;
  @override
  final String? deadLineMessage;

  @override
  String toString() {
    return 'GoalEntity(title: $title, description: $description, createdAt: $createdAt, deadline: $deadline, isCompleted: $isCompleted, isPublic: $isPublic, userName: $userName, movies: $movies, qtdMoviesWatchedInGoal: $qtdMoviesWatchedInGoal, goalPercentage: $goalPercentage, goalMessage: $goalMessage, deadLineMessage: $deadLineMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.qtdMoviesWatchedInGoal, qtdMoviesWatchedInGoal) ||
                other.qtdMoviesWatchedInGoal == qtdMoviesWatchedInGoal) &&
            (identical(other.goalPercentage, goalPercentage) ||
                other.goalPercentage == goalPercentage) &&
            (identical(other.goalMessage, goalMessage) ||
                other.goalMessage == goalMessage) &&
            (identical(other.deadLineMessage, deadLineMessage) ||
                other.deadLineMessage == deadLineMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    createdAt,
    deadline,
    isCompleted,
    isPublic,
    userName,
    const DeepCollectionEquality().hash(_movies),
    qtdMoviesWatchedInGoal,
    goalPercentage,
    goalMessage,
    deadLineMessage,
  );

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalEntityImplCopyWith<_$GoalEntityImpl> get copyWith =>
      __$$GoalEntityImplCopyWithImpl<_$GoalEntityImpl>(this, _$identity);
}

abstract class _GoalEntity implements GoalEntity {
  const factory _GoalEntity({
    required final String title,
    final String? description,
    required final DateTime createdAt,
    required final DateTime deadline,
    final bool isCompleted,
    final bool isPublic,
    final String? userName,
    final List<MovieEntity> movies,
    final int qtdMoviesWatchedInGoal,
    final double? goalPercentage,
    final String? goalMessage,
    final String? deadLineMessage,
  }) = _$GoalEntityImpl;

  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get deadline;
  @override
  bool get isCompleted;
  @override
  bool get isPublic;
  @override
  String? get userName;
  @override
  List<MovieEntity> get movies;
  @override
  int get qtdMoviesWatchedInGoal;
  @override
  double? get goalPercentage;
  @override
  String? get goalMessage;
  @override
  String? get deadLineMessage;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalEntityImplCopyWith<_$GoalEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
