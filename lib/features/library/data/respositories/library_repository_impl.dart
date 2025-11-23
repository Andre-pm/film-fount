import 'package:film_fount/features/library/data/datasources/library_datasource.dart';
import 'package:film_fount/features/library/data/mappers/library_movie_mapper.dart';
import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';

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
}
