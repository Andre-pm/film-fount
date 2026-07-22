import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/goals/data/datasources/goal_datasource.dart';
import 'package:film_fount/features/goals/data/repositories/goal_repository_impl.dart';
import 'package:film_fount/features/goals/domain/entities/goal_entity.dart';
import 'package:film_fount/features/goals/domain/repositories/goal_repository.dart';
import 'package:film_fount/features/goals/domain/usecases/add_goal_usecase.dart';
import 'package:film_fount/features/goals/domain/usecases/get_goals_usecase.dart';
import 'package:film_fount/features/goals/presentation/notifiers/goal_notifier.dart';
import 'package:film_fount/features/goals/presentation/notifiers/goal_register_notifier.dart';
import 'package:film_fount/features/library/presentation/providers/library_providers.dart';
import 'package:film_fount/features/search/presentation/providers/search_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goalDatasourceProvider = Provider<GoalDatasource>(
  (ref) => GoalDatasource(
    database: ref.watch(firebaseDatabaseProvider),
    auth: ref.watch(firebaseAuthProvider),
  ),
);

final goalRepositoryProvider = Provider<GoalRepository>(
  (ref) => GoalRepositoryImpl(ref.watch(goalDatasourceProvider)),
);

final getGoalsUseCaseProvider = Provider<GetGoalsUsecase>(
  (ref) => GetGoalsUsecase(ref.watch(goalRepositoryProvider)),
);

final addGoalUseCaseProvider = Provider<AddGoalUseCase>(
  (ref) => AddGoalUseCase(ref.watch(goalRepositoryProvider)),
);

final goalNotifierProvider =
    StateNotifierProvider.autoDispose<GoalNotifier, AppState<GoalListEntity>>(
      (ref) => GoalNotifier(
        ref.watch(getGoalsUseCaseProvider),
        ref.watch(addGoalUseCaseProvider),
        ref.watch(libraryDatasourceProvider),
      ),
    );

final goalRegisterNotifierProvider =
    StateNotifierProvider.autoDispose<GoalRegisterNotifier, GoalRegisterState>(
      (ref) => GoalRegisterNotifier(ref.watch(searchMovieUseCaseProvider)),
    );
