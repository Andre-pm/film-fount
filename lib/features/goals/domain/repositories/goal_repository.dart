import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';

abstract class GoalRepository {
  Future<bool> addGoal(GoalEntity goal);
  Future<GoalListEntity> getGoals();
  Future<void> updateGoal(GoalEntity goal);
  Future<void> deleteGoal(String id);
}
