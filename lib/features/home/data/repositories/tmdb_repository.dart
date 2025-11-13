import 'package:film_fount/features/home/domain/entities/movie_detail_response.dart';
import 'package:film_fount/features/home/domain/entities/movie_recommendations_response.dart';
import 'package:film_fount/features/home/domain/entities/movie_search_response.dart';

abstract class TMDBRepository {
  Future<MovieSearchResponse> searchMovie(String query);
  Future<MovieDetailResponse> getMovieDetails(int movieId);
  Future<MovieRecommendationsResponse> getMovieRecommendations(int movieId);
}
