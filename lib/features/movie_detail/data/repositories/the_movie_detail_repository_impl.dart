import 'package:film_fount/features/movie_detail/data/datasources/movie_detail_datasource.dart';
import 'package:film_fount/features/movie_detail/data/mappers/movie_details_mapper.dart';
import 'package:film_fount/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/search/data/mappers/movie_mapper.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

class TheMovieDetailRepositoryImpl implements TheMovieDetailRepository {
  final MovieDetailDatasource _datasource;

  TheMovieDetailRepositoryImpl(this._datasource);

  @override
  Future<MovieDetailEntity> getMovieDetails(int movieId) async {
    final movieDetailModel = await _datasource.getMovieDetail(movieId);
    return movieDetailModel.toEntity();
  }

  @override
  Future<bool> addToWatchList(MovieDetailEntity movie) {
    final movieDetailModel = MovieDetailModel.fromEntity(movie);
    return _datasource.addToWatchList(movieDetailModel);
  }

  @override
  Future<bool> isOnWatchList(int movieId) {
    return _datasource.isOnWatchList(movieId);
  }

  @override
  Future<bool> removeFromWatchList(MovieDetailEntity movie) {
    return _datasource.removeFromWatchList(movie.id);
  }

  @override
  Future<List<MovieEntity>> getSimilarMovies(int movieId, int? page) async {
    final movieModel = await _datasource.getSuggestion(movieId, page);
    return movieModel.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getRecommendations(int movieId, int? page) async {
    final movieModel = await _datasource.getRecommendations(movieId, page);
    return movieModel.map((model) => model.toEntity()).toList();
  }
}
