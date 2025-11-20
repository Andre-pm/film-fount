import 'package:film_fount/features/home/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/home/domain/entities/movie_recommendations_entity.dart';
import 'package:film_fount/features/home/domain/entities/movie_entity.dart';

abstract class TheMovieDatabaseRepository {
  Future<List<MovieEntity>> searchMovie(String query);
  Future<MovieDetailEntity> getMovieDetails(int movieId);
  Future<MovieRecommendationsEntity> getMovieRecommendations(int movieId);
}
