import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';

abstract class LibraryRepository {
  Future<WatchListEntity> getLibraryMovies();
}
