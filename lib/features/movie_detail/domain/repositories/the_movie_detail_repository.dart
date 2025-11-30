import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

abstract class TheMovieDetailRepository {
  Future<MovieDetailEntity> getMovieDetails(int movieId);
  Future<bool> addToWatchList(MovieDetailEntity movie);
  Future<bool> isOnWatchList(int movieId);
  Future<bool> removeFromWatchList(MovieDetailEntity movie);
  Future<List<MovieEntity>> getSimilarMovies(int movieId, int? page);
  Future<List<MovieEntity>> getRecommendations(int movieId);
}
