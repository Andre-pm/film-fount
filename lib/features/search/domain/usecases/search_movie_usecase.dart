import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/domain/repositories/the_movie_database_repository.dart';

class SearchMovieUseCase {
  final TheMovieDatabaseRepository repository;

  SearchMovieUseCase(this.repository);

  Future<List<MovieEntity>> call(String query, int? page) {
    return repository.searchMovie(query, page);
  }
}
