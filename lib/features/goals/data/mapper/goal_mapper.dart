import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/goals/data/models/goal_model.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/search/data/models/movie_model.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

extension GoalMapper on GoalModel {
  GoalEntity toEntity() {
    return GoalEntity(
      title: title,
      description: description,
      createdAt: createdAt,
      deadline: deadline,
      isCompleted: isCompleted,
      isPublic: isPublic,
      userName: userName,
      movies: movies
          .map(
            (e) => MovieEntity(
              id: e.id,
              title: e.title.orEmpty,
              posterPath: e.posterPath.orEmpty,
              overview: e.overview.orEmpty,
              isWatched: false,
            ),
          )
          .toList(),
    );
  }

  static GoalModel fromEntity(GoalEntity goal) {
    return GoalModel(
      title: goal.title,
      description: goal.description,
      createdAt: goal.createdAt,
      deadline: goal.deadline,
      isCompleted: goal.isCompleted,
      isPublic: goal.isPublic,
      userName: goal.userName,
      movies: goal.movies
          .map(
            (e) =>
                MovieModel(id: e.id, title: e.title, posterPath: e.posterPath),
          )
          .toList(),
    );
  }
}
