import 'package:film_fount/features/library/data/models/library_movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';

@freezed
abstract class GoalModel with _$GoalModel {
  factory GoalModel({
    required int id,
    String? title,
    int? daysTarget,
    DateTime? initialDate,
    DateTime? conclusionDate,
    List<LibraryMovieModel>? movies,
    bool? completed,
  }) = _GoalModel;
}
