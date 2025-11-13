import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_response.freezed.dart';
part 'movie_detail_response.g.dart';

// https://image.tmdb.org/t/p/original/6tuNQ16hC4Qp7wjTweKzUnnLBkI.jpg
@freezed
class MovieDetailResponse with _$MovieDetailResponse {
  const factory MovieDetailResponse({
    String? backdrop_path,
    String? origin_country,
    String? original_language,
    String? original_title,
    String? overview,
    String? release_date,
    String? status,
  }) = _MovieDetailResponse;

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);
}
