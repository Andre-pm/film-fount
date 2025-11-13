import 'package:dio/dio.dart';
import 'package:film_fount/features/home/data/repositories/tmdb_repository.dart';
import 'package:film_fount/features/home/domain/entities/movie_detail_response.dart';
import 'package:film_fount/features/home/domain/entities/movie_recommendations_response.dart';
import 'package:film_fount/features/home/domain/entities/movie_search_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TMDBRepositoryImpl implements TMDBRepository {
  final Dio _dio;
  final String _apiKey = dotenv.env['TMDB_API_KEY']!;
  final String _baseUrl = 'https://api.themoviedb.org/3';

  TMDBRepositoryImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<MovieSearchResponse> searchMovie(String query) async {
    try {
      print('Query feita para: $_baseUrl/search/movie');
      final response = await _dio.get(
        '$_baseUrl/search/movie',
        queryParameters: {
          'query': query,
          'language': 'pt-BR',
          'page': 1,
          'include_adult': 'true',
        },
        options: Options(headers: {'Authorization': 'Bearer $_apiKey'}),
      );

      return MovieSearchResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetails(int movieId) async {
    try {
      print('Query feita para: $_baseUrl/movie/$movieId');
      final response = await _dio.get(
        '$_baseUrl/movie/$movieId',
        queryParameters: {'language': 'pt-BR'},
        options: Options(headers: {'Authorization': 'Bearer $_apiKey'}),
      );

      return MovieDetailResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  @override
  Future<MovieRecommendationsResponse> getMovieRecommendations(
    int movieId,
  ) async {
    try {
      print('Query feita para: $_baseUrl/movie/$movieId/recommendations');
      final response = await _dio.get(
        '$_baseUrl/movie/$movieId/recommendations',
        queryParameters: {'language': 'pt-BR'},
        options: Options(headers: {'Authorization': 'Bearer $_apiKey'}),
      );

      return MovieRecommendationsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }
}
