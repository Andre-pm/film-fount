import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/usecases/add_goal_usecase.dart';
import 'package:film_fount/features/goals/domain/usecases/get_goals_usecase.dart';
import 'package:film_fount/features/library/data/datasources/library_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalNotifier extends StateNotifier<AppState<GoalListEntity>> {
  final GetGoalsUsecase _getGoalsUseCase;
  final AddGoalUseCase _addGoalUseCase;
  final LibraryDatasource _libraryDatasource;
  GoalNotifier(
    this._getGoalsUseCase,
    this._addGoalUseCase,
    this._libraryDatasource,
  ) : super(AppState.initial()) {
    getGoals();
  }

  Future<void> getGoals() async {
    state = AppState.loading();
    try {
      final goals = await _getGoalsUseCase();
      final updatedGoals = <GoalEntity>[];

      for (var goal in goals.goals) {
        int count = 0;
        for (var movie in goal.movies) {
          final movieDetail = await _libraryDatasource.loadFirebaseWatchList(
            movie.id,
          );
          movie.isWatched = movieDetail.isWatched ?? false;
          if (movie.isWatched == true) {
            count++;
          }
        }

        String? goalMessage;
        String? deadLineMessage;
        final goalPercentage = goal.movies.isEmpty
            ? 0.0
            : (count / goal.movies.length) * 100;

        if (goalPercentage >= 100) {
          goalMessage = 'Parabéns! Você completou a meta!';
        } else if (count == 0) {
          goalMessage = 'Você ainda não assistiu a nenhum filme!';
        } else {
          goalMessage =
              'Você já assistiu a $count de ${goal.movies.length} filmes!';
        }

        var daysRemaining = (goal.deadline.difference(DateTime.now())).inDays;
        if (daysRemaining > 365) {
          deadLineMessage = '${(daysRemaining / 365).floor()} anos';
        } else if (daysRemaining > 30) {
          deadLineMessage = '${(daysRemaining / 30).floor()} meses';
        } else if (daysRemaining == 0) {
          deadLineMessage = 'Prazo final hoje!';
        } else if (daysRemaining < 0) {
          deadLineMessage = 'Prazo expirado!';
        } else {
          deadLineMessage = '$daysRemaining dias';
        }

        updatedGoals.add(
          goal.copyWith(
            qtdMoviesWatchedInGoal: count,
            goalPercentage: goalPercentage,
            goalMessage: goalMessage,
            deadLineMessage: deadLineMessage,
          ),
        );
      }

      state = AppState.data(goals.copyWith(goals: updatedGoals));
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<bool> addGoal(GoalEntity goal) async {
    try {
      state = AppState.loading();
      await _addGoalUseCase(goal);
      getGoals();
      return true;
    } catch (e) {
      state = AppState.error(e);
      return false;
    }
  }
}
