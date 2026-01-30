import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

abstract class LibraryRepository {
  Future<WatchListEntity> getLibraryMovies();
  Future<void> deleteLibrary(String userId);
  Future<bool> addToWatchList(MovieDetailEntity movie);
  Future<MovieDetailEntity> firebaseWatchListContent(int movieId);
  Future<bool> removeFromWatchList(MovieDetailEntity movie);
  Future<bool> updateWatched(int movieId, bool isWatched);
}
