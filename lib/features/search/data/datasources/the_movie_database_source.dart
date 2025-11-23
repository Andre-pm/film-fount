import 'package:dio/dio.dart';
import 'package:film_fount/features/search/data/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TheMovieDatabaseSource {
  final Dio client;
  final String apiKey = dotenv.env['TMDB_API_KEY']!;
  final String baseUrl = 'https://api.themoviedb.org/3';

  TheMovieDatabaseSource({required this.client});

  Future<List<MovieModel>> searchMovie(String query) async {
    try {
      final response = await client.get(
        '$baseUrl/search/movie',
        queryParameters: {
          'query': query,
          'language': 'pt-BR',
          'page': 1,
          'include_adult': 'false',
        },
        options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
      );

      final List<dynamic> results = response.data['results'];

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Falha ao carregar lista de filmes: \n$e');
    }
  }
}
