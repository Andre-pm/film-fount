import 'package:film_fount/features/library/domain/repositories/library_repository.dart';

class UpdateWatchedUseCase {
  final LibraryRepository repository;

  UpdateWatchedUseCase(this.repository);

  Future<bool> call(int movieId, bool isWatched) {
    return repository.updateWatched(movieId, isWatched);
  }
}
