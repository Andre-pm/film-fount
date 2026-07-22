class MovieEntity {
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? title;
  final String? releaseDate;
  MovieEntity({
    required this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
    this.releaseDate,
  });
}
