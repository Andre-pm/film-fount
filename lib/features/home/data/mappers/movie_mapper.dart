import 'package:film_fount/features/home/data/models/movie_model.dart';
import 'package:film_fount/features/home/domain/entities/movie_entity.dart';

extension MovieMapper on MovieModel {
  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: 'https://image.tmdb.org/t/p/w500$posterPath',
      title: title,
    );
  }
}
