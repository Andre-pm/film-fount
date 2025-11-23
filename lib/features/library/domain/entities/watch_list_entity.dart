import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_list_entity.freezed.dart';

@freezed
class WatchListEntity with _$WatchListEntity {
  factory WatchListEntity({List<LibraryMovieEntity>? watchList}) =
      _WatchListEntity;
}

@freezed
class LibraryMovieEntity with _$LibraryMovieEntity {
  factory LibraryMovieEntity({
    required int id,
    String? title,
    String? posterPath,
    bool? watched,
  }) = _LibraryMovieEntity;
}
