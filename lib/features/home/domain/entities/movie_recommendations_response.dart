import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_recommendations_response.freezed.dart';
part 'movie_recommendations_response.g.dart';

//TODO - Consultar imagem em https://image.tmdb.org/t/p/original/...
@freezed
class MovieRecommendationsResponse with _$MovieRecommendationsResponse {
  const factory MovieRecommendationsResponse({
    required int page,
    required int total_pages,
    required int total_results,
    required List<RecommendationsResponse> results,
  }) = _MovieRecommendationsResponse;

  factory MovieRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieRecommendationsResponseFromJson(json);
}

@freezed
class RecommendationsResponse with _$RecommendationsResponse {
  const factory RecommendationsResponse({
    required int id,
    String? title,
    String? original_title,
    String? poster_path,
    String? overview,
  }) = _RecommendationsResponse;

  factory RecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsResponseFromJson(json);
}
