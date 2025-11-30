import 'package:event_bus/event_bus.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/movie_detail/presentation/events/watchlist_updated_event.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:flutter_riverpod/legacy.dart';

final class MovieDetailNotifier
    extends StateNotifier<AppState<MovieDetailEntity>> {
  final TheMovieDetailRepository _repository;
  final int movieId;
  final EventBus eventBus;

  MovieDetailNotifier(this._repository, this.movieId, this.eventBus)
    : super(const AppState.initial()) {
    fetchMovieDetail(movieId);
  }
  int currentMovieId = 0;
  int similarMoviesPage = 1;

  Future<void> fetchMovieDetail(int? movieId) async {
    state = const AppState.loading();
    currentMovieId = movieId ?? 0;
    try {
      final id = movieId ?? 0;
      final results = await Future.wait([
        _repository.getMovieDetails(id),
        _repository.isOnWatchList(id),
        _repository.getSimilarMovies(id, similarMoviesPage),
        _repository.getRecommendations(id),
      ]);
      final movieResponse = results[0] as MovieDetailEntity;
      final isInWatchList = results[1] as bool;
      final similarMovies = results[2] as List<MovieEntity>;
      final recommendations = results[3] as List<MovieEntity>;

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
        similarMovies: similarMovies,
        recommendations: recommendations,
      );

      state = AppState.data(movieDetail);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> loadMoreSimilarMovies() async {
    similarMoviesPage++;
    final newMovies = await _repository.getSimilarMovies(
      currentMovieId,
      similarMoviesPage,
    );
    state.maybeWhen(
      data: (movieDetail) {
        final updatedList = [...?movieDetail.similarMovies, ...newMovies];

        state = AppState.data(movieDetail.copyWith(similarMovies: updatedList));
      },
      orElse: () {},
    );
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
        eventBus.fire(WatchListUpdatedEvent(updateWatchList: true));
        state = AppState.data(
          movieDetail.copyWith(isInWatchList: isInWatchList),
        );
      },
      orElse: () {},
    );
  }
}
