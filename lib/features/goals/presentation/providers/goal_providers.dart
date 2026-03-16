import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/goals/data/datasources/goals_datasource.dart';
import 'package:film_fount/features/goals/data/repositories/goal_repository_impl.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/entities/goal_repository.dart';
import 'package:film_fount/features/goals/presentation/notifiers/goal_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final goalsDatasourceProvider = Provider<GoalsDatasource>(
  (ref) => GoalsDatasource(
    database: ref.watch(firebaseDatabaseProvider),
    auth: ref.watch(firebaseAuthProvider),
  ),
);

final goalsRepositoryProvider = Provider<GoalRepository>(
  (ref) => GoalRepositoryImpl(ref.watch(goalsDatasourceProvider)),
);

final goalsNotifierProvider =
    StateNotifierProvider.autoDispose<GoalNotifier, AppState<GoalEntity>>(
      (ref) => GoalNotifier(ref.watch(goalsRepositoryProvider)),
    );
