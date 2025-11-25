import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/movie_detail/data/datasources/movie_detail_datasource.dart';
import 'package:film_fount/features/movie_detail/data/repositories/the_movie_detail_repository_impl.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/movie_detail/presentation/notifiers/movie_detail_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieDetailDatasourceProvider = Provider<MovieDetailDatasource>(
  (ref) => MovieDetailDatasource(
    client: ref.watch(dioProvider),
    auth: ref.watch(firebaseAuthProvider),
    database: ref.watch(firebaseDatabaseProvider),
  ),
);

final theMovieDetailRepositoryProvider = Provider<TheMovieDetailRepository>(
  (ref) =>
      TheMovieDetailRepositoryImpl(ref.watch(movieDetailDatasourceProvider)),
);

final movieDetailNotifierProvider =
    StateNotifierProvider.family<
      MovieDetailNotifier,
      AppState<MovieDetailEntity>,
      int
    >((ref, movieId) {
      return MovieDetailNotifier(
        ref.watch(theMovieDetailRepositoryProvider),
        movieId,
        ref.watch(eventBusProvider),
      );
    });
