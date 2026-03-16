import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/entities/goal_repository.dart';
import 'package:flutter_riverpod/legacy.dart';

class GoalNotifier extends StateNotifier<AppState<GoalEntity>> {
  final GoalRepository _repository;

  GoalNotifier(this._repository) : super(AppState.initial()) {
    fetchGoals();
  }
  GoalEntity? currentGoals;

  Future<void> fetchGoals() async {
    state = AppState.loading();
    try {
      currentGoals = await _repository.getGoals();
      state = AppState.data(currentGoals!);
    } catch (e) {
      state = AppState.error(e);
    }
  }
}
