import 'package:film_fount/features/home/domain/entities/movie_detail_response.dart'
    as data;
import 'package:film_fount/features/home/domain/entities/movie_recommendations_response.dart'
    as data;
import 'package:film_fount/features/home/domain/entities/movie_search_response.dart'
    as data;

abstract class TMDBRepository {
  Future<data.MovieSearchResponse> searchMovie(String query);
  Future<data.MovieDetailResponse> getMovieDetails(int movieId);
  Future<data.MovieRecommendationsResponse> getMovieRecommendations(
    int movieId,
  );
}
