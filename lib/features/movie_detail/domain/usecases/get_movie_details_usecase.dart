import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';

class GetMovieDetailsUseCase {
  final TheMovieDetailRepository repository;

  GetMovieDetailsUseCase(this.repository);

  Future<MovieDetailEntity> call(int movieId) {
    return repository.getMovieDetails(movieId);
  }
}
