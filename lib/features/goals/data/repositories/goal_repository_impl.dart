import 'package:film_fount/features/goals/data/datasources/goals_datasource.dart';
import 'package:film_fount/features/goals/data/mappers/goal_mapper.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/entities/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalsDatasource _datasource;

  GoalRepositoryImpl(this._datasource);
  @override
  Future<bool> addGoal(GoalItem goal, String userId) {
    // TODO: implement addGoal
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteGoal(int goalId, String userId) {
    // TODO: implement deleteGoal
    throw UnimplementedError();
  }

  @override
  Future<GoalEntity> getGoals() async {
    final goalsResponse = await _datasource.getGoals();
    final goals = goalsResponse.map((goal) => goal.toEntity()).toList();
    return GoalEntity(goals: goals);
  }

  @override
  Future<bool> updateGoal(GoalItem goal, String userId) {
    throw UnimplementedError();
  }
}
