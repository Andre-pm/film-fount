import 'package:event_bus/event_bus.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/library/domain/usecases/add_to_watch_list_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/firebase_watch_list_content_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/remove_from_watch_list_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/update_watched_usecase.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_fount/features/movie_detail/domain/usecases/get_recommendations_usecase.dart';
import 'package:film_fount/features/movie_detail/domain/usecases/get_similar_movies_usecase.dart';
import 'package:film_fount/features/movie_detail/presentation/events/watch_list_updated_event.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class MovieDetailNotifier
    extends StateNotifier<AppState<MovieDetailEntity>> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  final GetRecommendationsUseCase _getRecommendationsUseCase;
  final FirebaseWatchListContentUseCase _firebaseWatchListContentUseCase;
  final AddToWatchListUseCase _addToWatchListUseCase;
  final RemoveFromWatchListUseCase _removeFromWatchListUseCase;
  final UpdateWatchedUseCase _updateWatchedUseCase;

  final int movieId;
  final EventBus eventBus;

  MovieDetailNotifier(
    this._getMovieDetailsUseCase,
    this._getSimilarMoviesUseCase,
    this._getRecommendationsUseCase,
    this._firebaseWatchListContentUseCase,
    this._addToWatchListUseCase,
    this._removeFromWatchListUseCase,
    this._updateWatchedUseCase,
    this.movieId,
    this.eventBus,
  ) : super(const AppState.initial()) {
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
        _getMovieDetailsUseCase(id),
        _firebaseWatchListContentUseCase(id),
        _getSimilarMoviesUseCase(id, similarMoviesPage),
        _getRecommendationsUseCase(id, recommendationsPage),
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
    final newMovies = await _getSimilarMoviesUseCase(
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
    final newRecommendations = await _getRecommendationsUseCase(
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
      final success = await _addToWatchListUseCase(movie);
      if (success) {
        refreshWatchListStatus(isInWatchList: true);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromWatchList(MovieDetailEntity movie) async {
    try {
      await isWatched(movie.id, false).then((_) async {
        final success = await _removeFromWatchListUseCase(movie);
        if (success) {
          refreshWatchListStatus(isInWatchList: false);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> isWatched(int movieId, bool isWatched) async {
    try {
      final success = await _updateWatchedUseCase(
        movieId,
        isWatched,
      );
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
