import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

class FirebaseWatchListContentUseCase {
  final LibraryRepository repository;

  FirebaseWatchListContentUseCase(this.repository);

  Future<MovieDetailEntity> call(int movieId) {
    return repository.firebaseWatchListContent(movieId);
  }
}
