import 'package:film_fount/features/search/data/models/movie_model.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';

extension MovieMapper on MovieModel {
  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath != null
          ? 'https://image.tmdb.org/t/p/w500$posterPath'
          : null,
      title: title,
    );
  }
}
