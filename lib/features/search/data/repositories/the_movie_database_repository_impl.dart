import 'package:film_fount/features/search/data/datasources/the_movie_database_source.dart';
import 'package:film_fount/features/search/data/mappers/movie_mapper.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/domain/repositories/the_movie_database_repository.dart';

class TheMovieDatabaseRepositoryImpl implements TheMovieDatabaseRepository {
  final TheMovieDatabaseSource _datasource;

  TheMovieDatabaseRepositoryImpl(this._datasource);

  @override
  Future<List<MovieEntity>> searchMovie(String query) async {
    final movieModels = await _datasource.searchMovie(query);
    return movieModels.map((model) => model.toEntity()).toList();
  }
}
