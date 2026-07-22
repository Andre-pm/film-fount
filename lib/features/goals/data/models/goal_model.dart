import 'package:film_fount/features/search/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';

@freezed
abstract class GoalModel with _$GoalModel {
  const factory GoalModel({
    required String id,
    required String title,
    String? description,
    required DateTime createdAt,
    required DateTime deadline,
    @Default(false) bool isCompleted,
    @Default([]) List<MovieModel> movies,
  }) = _GoalModel;
}
