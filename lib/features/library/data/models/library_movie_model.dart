import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_movie_model.freezed.dart';

@freezed
abstract class LibraryMovieModel with _$LibraryMovieModel {
  factory LibraryMovieModel({
    required int id,
    String? title,
    String? posterPath,
    bool? watched,
  }) = _LibraryMovieModel;
}
