import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/library/data/datasources/library_datasource.dart';
import 'package:film_fount/features/library/data/respositories/library_repository_impl.dart';
import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/library/presentation/notifiers/library_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final libraryDatasourceProvider = Provider<LibraryDatasource>(
  (ref) => LibraryDatasource(
    database: ref.watch(firebaseDatabaseProvider),
    auth: ref.watch(firebaseAuthProvider),
  ),
);

final libraryRepositoryProvider = Provider<LibraryRepository>(
  (ref) => LibraryRepositoryImpl(ref.watch(libraryDatasourceProvider)),
);

final libraryNotifierProvider =
    StateNotifierProvider.autoDispose<
      LibraryNotifier,
      AppState<WatchListEntity>
    >((ref) => LibraryNotifier(ref.watch(libraryRepositoryProvider)));
