import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/usecases/get_goals_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalNotifier extends StateNotifier<AppState<GoalListEntity>> {
  final GetGoalsUsecase _getGoalsUseCase;
  GoalNotifier(this._getGoalsUseCase) : super(AppState.initial()) {
    getGoals();
  }

  Future<void> getGoals() async {
    state = AppState.loading();
    try {
      final goals = await _getGoalsUseCase();
      state = AppState.data(goals);
    } catch (e) {
      state = AppState.error(e);
    }
  }
}
