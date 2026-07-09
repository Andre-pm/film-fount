import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

class GetSimilarMoviesUseCase {
  final TheMovieDetailRepository repository;

  GetSimilarMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call(int movieId, int? page) {
    return repository.getSimilarMovies(movieId, page);
  }
}
