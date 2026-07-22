import 'package:film_fount/features/goals/data/datasources/goal_datasource.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/repositories/goal_repository.dart';
import 'package:film_fount/features/goals/data/mapper/goal_mapper.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalDatasource _datasource;

  GoalRepositoryImpl(this._datasource);

  @override
  Future<bool> addGoal(GoalEntity goal) {
    final goalModel = GoalMapper.fromEntity(goal);
    return _datasource.addGoal(goalModel);
  }

  @override
  Future<GoalListEntity> getGoals() async {
    final goals = await _datasource.getGoals();
    return GoalListEntity(goals: goals.map((e) => e.toEntity()).toList());
  }

  Future<void> updateGoal(GoalEntity goal) {
    return _datasource.updateGoal(GoalMapper.fromEntity(goal));
  }

  Future<void> deleteGoal(String id) {
    return _datasource.deleteGoal(id);
  }
}
