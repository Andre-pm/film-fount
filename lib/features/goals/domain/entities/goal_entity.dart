import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_entity.freezed.dart';

@freezed
class GoalListEntity with _$GoalListEntity {
  const factory GoalListEntity({@Default([]) List<GoalEntity> goals}) =
      _GoalListEntity;
}

@freezed
class GoalEntity with _$GoalEntity {
  const factory GoalEntity({
    required String id,
    required String title,
    String? description,
    required DateTime createdAt,
    required DateTime deadline,
    @Default(false) bool isCompleted,
    @Default([]) List<MovieEntity> movies,
  }) = _GoalEntity;
}
