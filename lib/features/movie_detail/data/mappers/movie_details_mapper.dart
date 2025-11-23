import 'package:film_fount/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

extension MovieDetailsMapper on MovieDetailModel {
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: 'https://image.tmdb.org/t/p/original$posterPath',
      title: title,
      backdropPath: 'https://image.tmdb.org/t/p/original$backdropPath',
      genres: genres?.map((genre) => genre).toList(),
      homepage: homepage,
      releaseDate: releaseDate,
      status: status,
    );
  }
}
