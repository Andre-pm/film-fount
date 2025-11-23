import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

abstract class TheMovieDetailRepository {
  Future<MovieDetailEntity> getMovieDetails(int movieId);
  Future<bool> addToWatchList(MovieDetailEntity movie);
  Future<bool> isOnWatchList(int movieId);
  Future<bool> removeFromWatchList(MovieDetailEntity movie);
}
