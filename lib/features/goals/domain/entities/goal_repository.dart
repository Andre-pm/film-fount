import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';

abstract class GoalRepository {
  Future<GoalEntity> getGoals();
  Future<bool> addGoal(GoalItem goal, String userId);
  Future<bool> updateGoal(GoalItem goal, String userId);
  Future<bool> deleteGoal(int goalId, String userId);
}
