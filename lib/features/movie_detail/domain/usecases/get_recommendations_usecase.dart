import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

class GetRecommendationsUseCase {
  final TheMovieDetailRepository repository;

  GetRecommendationsUseCase(this.repository);

  Future<List<MovieEntity>> call(int movieId, int? page) {
    return repository.getRecommendations(movieId, page);
  }
}
