// https://image.tmdb.org/t/p/original/6tuNQ16hC4Qp7wjTweKzUnnLBkI.jpg
class MovieDetailEntity {
  final String? backdropPath;
  final String? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? releaseDate;
  final String? status;

  MovieDetailEntity({
    this.backdropPath,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.status,
  });
}
