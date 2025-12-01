import 'package:event_bus/event_bus.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/movie_detail/presentation/events/watch_list_updated_event.dart';
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
  bool isMoreSimilarMovies = true;
  int recommendationsPage = 1;
  bool isMoreRecommendations = true;

  Future<void> fetchMovieDetail(int? movieId) async {
    state = const AppState.loading();
    currentMovieId = movieId ?? 0;
    try {
      final id = movieId ?? 0;
      final results = await Future.wait([
        _repository.getMovieDetails(id),
        _repository.firebaseWatchListContent(id),
        _repository.getSimilarMovies(id, similarMoviesPage),
        _repository.getRecommendations(id, recommendationsPage),
      ]);
      final movieResponse = results[0] as MovieDetailEntity;
      final firebaseWatchListContent = results[1] as MovieDetailEntity;
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
        runtime: movieResponse.runtime,
        isInWatchList: firebaseWatchListContent.isInWatchList,
        isWatched: firebaseWatchListContent.isWatched,
        similarMovies: similarMovies,
        recommendations: recommendations,
      );

      state = AppState.data(movieDetail);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<bool> loadMoreSimilarMovies() async {
    similarMoviesPage++;
    final newMovies = await _repository.getSimilarMovies(
      currentMovieId,
      similarMoviesPage,
    );
    if (newMovies.isEmpty) {
      isMoreSimilarMovies = false;
    } else {
      state.maybeWhen(
        data: (movieDetail) {
          final updatedList = [...?movieDetail.similarMovies, ...newMovies];

          state = AppState.data(
            movieDetail.copyWith(similarMovies: updatedList),
          );
        },
        orElse: () {},
      );
    }
    return isMoreSimilarMovies;
  }

  Future<bool> loadMoreRecommendations() async {
    recommendationsPage++;
    final newRecommendations = await _repository.getRecommendations(
      currentMovieId,
      recommendationsPage,
    );
    if (newRecommendations.isEmpty) {
      isMoreRecommendations = false;
    } else {
      state.maybeWhen(
        data: (movieDetail) {
          final updatedList = [
            ...?movieDetail.recommendations,
            ...newRecommendations,
          ];

          state = AppState.data(
            movieDetail.copyWith(recommendations: updatedList),
          );
        },
        orElse: () {},
      );
    }
    return isMoreRecommendations;
  }

  Future<void> addToWatchList(MovieDetailEntity movie) async {
    try {
      final success = await _repository.addToWatchList(movie);
      if (success) {
        refreshWatchListStatus(isInWatchList: true);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromWatchList(MovieDetailEntity movie) async {
    try {
      final success = await _repository.removeFromWatchList(movie);
      if (success) {
        refreshWatchListStatus(isInWatchList: false);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> isWatched(int movieId, bool isWatched) async {
    try {
      final success = await _repository.updateWatched(movieId, isWatched);
      if (success) {
        refreshWatchListStatus(isWatched: isWatched);
      }
    } catch (e) {
      rethrow;
    }
  }

  void refreshWatchListStatus({bool? isInWatchList, bool? isWatched}) {
    state.maybeWhen(
      data: (movieDetail) {
        eventBus.fire(WatchListUpdatedEvent(updateWatchList: true));
        state = AppState.data(
          movieDetail.copyWith(
            isInWatchList: isInWatchList ?? movieDetail.isInWatchList,
            isWatched: isWatched ?? movieDetail.isWatched,
          ),
        );
      },
      orElse: () {},
    );
  }
}
