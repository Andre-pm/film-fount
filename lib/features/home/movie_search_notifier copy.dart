import 'package:film_fount/features/home/data/repositories/tmdb_repository.dart';
import 'package:film_fount/features/home/data/repositories/tmdb_repository_provider.dart';
import 'package:film_fount/features/home/domain/entities/movie_search_response.dart';
import 'package:film_fount/features/home/state_notifier.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieSearchNotifierProvider =
    StateNotifierProvider<MovieSearchNotifier, AppState<MovieSearchResponse>>((
      ref,
    ) {
      return MovieSearchNotifier(ref.watch(tmdbRepositoryProvider));
    });

class MovieSearchNotifier extends StateNotifier<AppState<MovieSearchResponse>> {
  final TMDBRepository _tmdbRepository;

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
