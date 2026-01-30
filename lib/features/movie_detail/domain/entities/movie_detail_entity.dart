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
    MovieStatus? status,
    String? runtime,
    @Default(false) bool isInWatchList,
    @Default(false) bool isWatched,
    List<MovieEntity>? similarMovies,
    List<MovieEntity>? recommendations,
  }) = _MovieDetailEntity;
}

enum MovieStatus { released, production, unknown }
