import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

class RemoveFromWatchListUseCase {
  final LibraryRepository repository;

  RemoveFromWatchListUseCase(this.repository);

  Future<bool> call(MovieDetailEntity movie) {
    return repository.removeFromWatchList(movie);
  }
}
