import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_entity.freezed.dart';

@freezed
class MovieDetailEntity with _$MovieDetailEntity {
  const factory MovieDetailEntity({
    required int id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? title,
    String? backdropPath,
    List<String>? genres,
    String? homepage,
    String? releaseDate,
    String? status,
    @Default(false) bool isInWatchList,
    List<MovieEntity>? similarMovies,
    List<MovieEntity>? recommendations,
  }) = _MovieDetailEntity;
}
