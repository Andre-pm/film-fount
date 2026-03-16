import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_entity.freezed.dart';

@freezed
abstract class GoalEntity with _$GoalEntity {
  factory GoalEntity({List<GoalItem>? goals}) = _GoalEntity;
}

@freezed
class GoalItem with _$GoalItem {
  factory GoalItem({
    required int id,
    String? title,
    int? daysTarget,
    DateTime? initialDate,
    DateTime? conclusionDate,
    List<LibraryMovieEntity>? movies,
    bool? completed,
  }) = _GoalItem;
}
