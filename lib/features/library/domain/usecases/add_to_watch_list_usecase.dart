import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

class AddToWatchListUseCase {
  final LibraryRepository repository;

  AddToWatchListUseCase(this.repository);

  Future<bool> call(MovieDetailEntity movie) {
    return repository.addToWatchList(movie);
  }
}
