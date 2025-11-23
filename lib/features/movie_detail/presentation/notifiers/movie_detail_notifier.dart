import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:flutter_riverpod/legacy.dart';

final class MovieDetailNotifier
    extends StateNotifier<AppState<MovieDetailEntity>> {
  final TheMovieDetailRepository _repository;
  final int movieId;

  MovieDetailNotifier(this._repository, this.movieId)
    : super(const AppState.initial()) {
    fetchMovieDetail(movieId);
  }

  Future<void> fetchMovieDetail(int? movieId) async {
    state = const AppState.loading();
    try {
      final movieResponse = await _repository.getMovieDetails(movieId ?? 0);
      final isInWatchList = await _repository.isOnWatchList(movieId ?? 0);
      final movieDetail = MovieDetailEntity(
        id: movieResponse.id,
        originalLanguage: movieResponse.originalLanguage,
        originalTitle: movieResponse.originalTitle,
        overview: movieResponse.overview,
        posterPath: movieResponse.posterPath,
        title: movieResponse.title,
        backdropPath: movieResponse.backdropPath,
        genres: movieResponse.genres,
        homepage: movieResponse.homepage,
        releaseDate: movieResponse.releaseDate,
        status: movieResponse.status,
        isInWatchList: isInWatchList,
      );

      state = AppState.data(movieDetail);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> addToWatchList(MovieDetailEntity movie) async {
    try {
      final success = await _repository.addToWatchList(movie);
      if (success) {
        refreshWatchListStatus(true);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromWatchList(MovieDetailEntity movie) async {
    try {
      final success = await _repository.removeFromWatchList(movie);
      if (success) {
        refreshWatchListStatus(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  void refreshWatchListStatus(bool isInWatchList) {
    state.maybeWhen(
      data: (movieDetail) {
        state = AppState.data(
          movieDetail.copyWith(isInWatchList: isInWatchList),
        );
      },
      orElse: () {},
    );
  }
}
