import 'package:film_fount/features/library/domain/repositories/library_repository.dart';

class DeleteLibraryUseCase {
  final LibraryRepository repository;

  DeleteLibraryUseCase(this.repository);

  Future<void> call(String userId) {
    return repository.deleteLibrary(userId);
  }
}
