import 'package:dio/dio.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/search/data/datasources/the_movie_database_source.dart';
import 'package:film_fount/features/search/data/repositories/the_movie_database_repository_impl.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/domain/repositories/the_movie_database_repository.dart';
import 'package:film_fount/features/search/presentation/notifiers/movie_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final theMovieDatabaseSourceProvider = Provider<TheMovieDatabaseSource>(
  (ref) => TheMovieDatabaseSource(client: ref.watch(dioProvider)),
);

final theMovieDatabaseRepositoryProvider = Provider<TheMovieDatabaseRepository>(
  (ref) =>
      TheMovieDatabaseRepositoryImpl(ref.watch(theMovieDatabaseSourceProvider)),
);

final movieSearchNotifierProvider =
    StateNotifierProvider.autoDispose<
      MovieSearchNotifier,
      AppState<List<MovieEntity>>
    >((ref) {
      return MovieSearchNotifier(ref.watch(theMovieDatabaseRepositoryProvider));
    });
