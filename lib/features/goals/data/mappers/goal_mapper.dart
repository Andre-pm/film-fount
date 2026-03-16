import 'package:film_fount/features/goals/data/models/goal_model.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/library/data/mappers/library_movie_mapper.dart';

extension GoalMapper on GoalModel {
  GoalItem toEntity() {
    return GoalItem(
      id: id,
      title: title,
      daysTarget: daysTarget,
      initialDate: initialDate,
      conclusionDate: conclusionDate,
      movies: movies?.map((movie) => movie.toEntity()).toList(),
      completed: completed,
    );
  }
}
