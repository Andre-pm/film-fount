// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GoalModel {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get daysTarget => throw _privateConstructorUsedError;
  DateTime? get initialDate => throw _privateConstructorUsedError;
  DateTime? get conclusionDate => throw _privateConstructorUsedError;
  List<LibraryMovieModel>? get movies => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalModelCopyWith<GoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalModelCopyWith<$Res> {
  factory $GoalModelCopyWith(GoalModel value, $Res Function(GoalModel) then) =
      _$GoalModelCopyWithImpl<$Res, GoalModel>;
  @useResult
  $Res call({
    int id,
    String? title,
    int? daysTarget,
    DateTime? initialDate,
    DateTime? conclusionDate,
    List<LibraryMovieModel>? movies,
    bool? completed,
  });
}

/// @nodoc
class _$GoalModelCopyWithImpl<$Res, $Val extends GoalModel>
    implements $GoalModelCopyWith<$Res> {
  _$GoalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalModel
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
                      as List<LibraryMovieModel>?,
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
abstract class _$$GoalModelImplCopyWith<$Res>
    implements $GoalModelCopyWith<$Res> {
  factory _$$GoalModelImplCopyWith(
    _$GoalModelImpl value,
    $Res Function(_$GoalModelImpl) then,
  ) = __$$GoalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? title,
    int? daysTarget,
    DateTime? initialDate,
    DateTime? conclusionDate,
    List<LibraryMovieModel>? movies,
    bool? completed,
  });
}

/// @nodoc
class __$$GoalModelImplCopyWithImpl<$Res>
    extends _$GoalModelCopyWithImpl<$Res, _$GoalModelImpl>
    implements _$$GoalModelImplCopyWith<$Res> {
  __$$GoalModelImplCopyWithImpl(
    _$GoalModelImpl _value,
    $Res Function(_$GoalModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalModel
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
      _$GoalModelImpl(
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
                  as List<LibraryMovieModel>?,
        completed: freezed == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc

class _$GoalModelImpl implements _GoalModel {
  _$GoalModelImpl({
    required this.id,
    this.title,
    this.daysTarget,
    this.initialDate,
    this.conclusionDate,
    final List<LibraryMovieModel>? movies,
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
  final List<LibraryMovieModel>? _movies;
  @override
  List<LibraryMovieModel>? get movies {
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
    return 'GoalModel(id: $id, title: $title, daysTarget: $daysTarget, initialDate: $initialDate, conclusionDate: $conclusionDate, movies: $movies, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalModelImpl &&
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

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalModelImplCopyWith<_$GoalModelImpl> get copyWith =>
      __$$GoalModelImplCopyWithImpl<_$GoalModelImpl>(this, _$identity);
}

abstract class _GoalModel implements GoalModel {
  factory _GoalModel({
    required final int id,
    final String? title,
    final int? daysTarget,
    final DateTime? initialDate,
    final DateTime? conclusionDate,
    final List<LibraryMovieModel>? movies,
    final bool? completed,
  }) = _$GoalModelImpl;

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
  List<LibraryMovieModel>? get movies;
  @override
  bool? get completed;

  /// Create a copy of GoalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalModelImplCopyWith<_$GoalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
