import 'package:film_fount/features/home/domain/entities/movie_entity.dart';
import 'package:film_fount/features/home/domain/repositories/the_movie_database_repository.dart';
import 'package:film_fount/features/home/presentation/providers/home_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieSearchNotifierProvider =
    StateNotifierProvider<MovieSearchNotifier, AppState<List<MovieEntity>>>((
      ref,
    ) {
      return MovieSearchNotifier(ref.watch(theMovieDatabaseRepositoryProvider));
    });

class MovieSearchNotifier extends StateNotifier<AppState<List<MovieEntity>>> {
  final TheMovieDatabaseRepository _tmdbRepository;

  MovieSearchNotifier(this._tmdbRepository) : super(AppState.initial());

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) return;
    state = AppState.loading();
    try {
      final movies = await _tmdbRepository.searchMovie(query);
      state = AppState.data(movies);
    } catch (e) {
      state = AppState.error(e);
    }
  }
}
