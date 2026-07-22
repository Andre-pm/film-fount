import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/repositories/goal_repository.dart';

class GetGoalsUsecase {
  final GoalRepository repository;

  GetGoalsUsecase(this.repository);

  Future<GoalListEntity> call() async {
    return await repository.getGoals();
  }
}
