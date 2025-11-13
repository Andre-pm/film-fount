import 'package:film_fount/features/home/data/repositories/tmdb_repository.dart';
import 'package:film_fount/features/home/data/repositories/tmdb_repository_provider.dart';
import 'package:film_fount/features/home/domain/entities/movie_detail_response.dart';
import 'package:film_fount/features/home/state_notifier.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieDetailsNotifierProvider =
    StateNotifierProvider<MovieDetailsNotifier, AppState<MovieDetailResponse>>((
      ref,
    ) {
      return MovieDetailsNotifier(ref.watch(tmdbRepositoryProvider));
    });

class MovieDetailsNotifier
    extends StateNotifier<AppState<MovieDetailResponse>> {
  final TMDBRepository _tmdbRepository;

  MovieDetailsNotifier(this._tmdbRepository) : super(AppState.initial());

  Future<void> getMovieDetails(int movieId) async {
    state = AppState.loading();
    try {
      final movie = await _tmdbRepository.getMovieDetails(movieId);
      state = AppState.data(movie);
    } catch (e) {
      state = AppState.error(e);
    }
  }
}
