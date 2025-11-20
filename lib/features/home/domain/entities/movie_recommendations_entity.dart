class MovieRecommendationsEntity {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<RecommendationsEntity> results;

  MovieRecommendationsEntity({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });
}

class RecommendationsEntity {
  final int id;
  final String? title;
  final String? originalTitle;
  final String? posterPath;
  final String? overview;
  RecommendationsEntity({
    required this.id,
    this.title,
    this.originalTitle,
    this.posterPath,
    this.overview,
  });
}
