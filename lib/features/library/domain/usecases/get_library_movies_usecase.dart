import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';

class GetLibraryMoviesUseCase {
  final LibraryRepository repository;

  GetLibraryMoviesUseCase(this.repository);

  Future<WatchListEntity> call() {
    return repository.getLibraryMovies();
  }
}
