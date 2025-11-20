import 'package:film_fount/features/home/data/datasources/the_movie_database_source.dart';
import 'package:film_fount/features/home/data/mappers/movie_mapper.dart';
import 'package:film_fount/features/home/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/home/domain/entities/movie_entity.dart';
import 'package:film_fount/features/home/domain/entities/movie_recommendations_entity.dart';
import 'package:film_fount/features/home/domain/repositories/the_movie_database_repository.dart';

class TheMovieDatabaseRepositoryImpl implements TheMovieDatabaseRepository {
  final TheMovieDatabaseSource _datasource;

  TheMovieDatabaseRepositoryImpl(this._datasource);

  @override
  Future<MovieDetailEntity> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<MovieRecommendationsEntity> getMovieRecommendations(int movieId) {
    // TODO: implement getMovieRecommendations
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>> searchMovie(String query) async {
    final movieModels = await _datasource.searchMovie(query);
    return movieModels.map((model) => model.toEntity()).toList();
  }
}
