import 'package:film_fount/features/library/data/datasources/library_datasource.dart';
import 'package:film_fount/features/library/data/mappers/library_movie_mapper.dart';
import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/movie_detail/data/mappers/movie_details_mapper.dart';
import 'package:film_fount/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final LibraryDatasource _datasource;
  LibraryRepositoryImpl(this._datasource);

  @override
  Future<WatchListEntity> getLibraryMovies() async {
    final libraryMovieModel = await _datasource.getLibraryMovies();
    final watchList = libraryMovieModel
        .map((model) => model.toEntity())
        .toList();
    return WatchListEntity(watchList: watchList);
  }

  @override
  Future<void> deleteLibrary(String userId) async {
    return _datasource.deleteLibrary(userId);
  }

  @override
  Future<bool> addToWatchList(MovieDetailEntity movie) {
    final movieDetailModel = MovieDetailModel.fromEntity(movie);
    return _datasource.addToWatchList(movieDetailModel);
  }

  @override
  Future<bool> removeFromWatchList(MovieDetailEntity movie) {
    return _datasource.removeFromWatchList(movie.id);
  }

  @override
  Future<bool> updateWatched(int movieId, bool isWatched) {
    return _datasource.changeWatched(movieId, isWatched);
  }

  @override
  Future<MovieDetailEntity> firebaseWatchListContent(int movieId) async {
    final movieModel = await _datasource.loadFirebaseWatchList(movieId);
    return movieModel.toEntity();
  }
}
