import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

class MovieDetailModel {
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? title;
  final String? backdropPath;
  final List<String>? genres;
  final String? homepage;
  final String? releaseDate;
  final String? status;
  final int? runtime;
  final bool? isWatched;
  final bool? isOnWatchList;

  MovieDetailModel({
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
    this.backdropPath,
    this.genres,
    this.homepage,
    this.releaseDate,
    this.status,
    this.runtime,
    this.isWatched,
    this.isOnWatchList,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genres: (json['genres'] as List<dynamic>?)
          ?.map((genre) => genre['name'] as String)
          .toList(),
      homepage: json['homepage'],
      releaseDate: json['release_date'],
      status: json['status'],
      runtime: json['runtime'],
    );
  }

  static fromEntity(MovieDetailEntity movie) {
    return MovieDetailModel(
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      posterPath: movie.posterPath,
      title: movie.title,
      backdropPath: movie.backdropPath,
      genres: movie.genres,
      homepage: movie.homepage,
      releaseDate: movie.releaseDate,
      status: movie.status?.name,
      runtime: 0,
    );
  }
}
