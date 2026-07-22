import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/repositories/goal_repository.dart';

class AddGoalUseCase {
  final GoalRepository repository;

  AddGoalUseCase(this.repository);

  Future<bool> call(GoalEntity goal) {
    return repository.addGoal(goal);
  }
}
