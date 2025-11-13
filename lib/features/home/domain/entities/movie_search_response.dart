import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_search_response.freezed.dart';
part 'movie_search_response.g.dart';

@freezed
class MovieSearchResponse with _$MovieSearchResponse {
  const factory MovieSearchResponse({
    required List<MovieItemResponse> results,
  }) = _MovieSearchResponse;

  factory MovieSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieSearchResponseFromJson(json);
}

@freezed
class MovieItemResponse with _$MovieItemResponse {
  const factory MovieItemResponse({
    required int id,
    String? original_language,
    String? original_title,
    String? overview,
    String? poster_path,
    String? title,
  }) = _MovieItemResponse;

  factory MovieItemResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieItemResponseFromJson(json);
}
