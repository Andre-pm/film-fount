import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

abstract class TheMovieDatabaseRepository {
  Future<List<MovieEntity>> searchMovie(String query);
}
