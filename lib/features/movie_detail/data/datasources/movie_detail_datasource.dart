import 'package:dio/dio.dart';
import 'package:film_fount/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:film_fount/features/search/data/models/movie_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieDetailDatasource {
  final Dio client;
  final FirebaseAuth auth;
  final FirebaseDatabase database;
  final String apiKey = dotenv.env['TMDB_API_KEY']!;
  final String baseUrl = 'https://api.themoviedb.org/3';

  MovieDetailDatasource({
    required this.client,
    required this.auth,
    required this.database,
  });

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    try {
      final response = await client.get(
        '$baseUrl/movie/$movieId',
        queryParameters: {'api_key': apiKey, 'language': 'pt-BR'},
        options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
      );

      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch movie detail: $e');
    }
  }

  Future<bool> addToWatchList(MovieDetailModel movie) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    try {
      watchListRef.push().set({
        'id': movie.id,
        'title': movie.title,
        'posterPath': movie.posterPath,
        'watched': false,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFromWatchList(int id) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    final DataSnapshot snapshot = await watchListRef.get();
    if (snapshot.exists) {
      final watchList = snapshot.value as Map<dynamic, dynamic>;
      for (final entry in watchList.entries) {
        final movie = entry.value as Map<dynamic, dynamic>;
        if (movie['id'] == id) {
          await watchListRef.child(entry.key).remove();
          return true;
        }
      }
    }
    return false;
  }

  Future<MovieDetailModel> loadFirebaseWatchList(int movieId) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    bool? isOnWatchList;
    bool? isWatched;

    final DataSnapshot snapshot = await watchListRef.get();
    if (snapshot.exists) {
      final watchList = snapshot.value as Map<dynamic, dynamic>;
      for (final entry in watchList.entries) {
        final movie = entry.value as Map<dynamic, dynamic>;
        if (movie['id'] == movieId) {
          isOnWatchList = true;
          if (movie['watched'] == true) {
            isWatched = true;
          }
        }
      }
    }
    return MovieDetailModel(
      id: 0,
      isOnWatchList: isOnWatchList,
      isWatched: isWatched,
    );
  }

  Future<bool> changeWatched(int movieId, bool isWatched) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    final DataSnapshot snapshot = await watchListRef.get();
    if (snapshot.exists) {
      final watchList = snapshot.value as Map<dynamic, dynamic>;
      for (final entry in watchList.entries) {
        final movie = entry.value as Map<dynamic, dynamic>;
        if (movie['id'] == movieId) {
          await watchListRef.child(entry.key).update({'watched': isWatched});
          return true;
        }
      }
    }
    return false;
  }

  Future<List<MovieModel>> getSuggestion(int movieId, int? page) async {
    try {
      final response = await client.get(
        '$baseUrl/movie/$movieId/similar',
        queryParameters: {
          'api_key': apiKey,
          'language': 'pt-BR',
          'include_adult': 'false',
          'page': page ?? 1,
        },
        options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Falha ao carregar lista de filmes similares: $e');
    }
  }

  Future<List<MovieModel>> getRecommendations(int movieId, int? page) async {
    try {
      final response = await client.get(
        '$baseUrl/movie/$movieId/recommendations',
        queryParameters: {
          'api_key': apiKey,
          'language': 'pt-BR',
          'include_adult': 'false',
          'page': page ?? 1,
        },
        options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Falha ao carregar lista de filmes recomendados: $e');
    }
  }
}
