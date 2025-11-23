import 'package:film_fount/features/library/data/models/library_movie_model.dart';
import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';

extension LibraryMovieMapper on LibraryMovieModel {
  LibraryMovieEntity toEntity() {
    return LibraryMovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      watched: watched,
    );
  }
}
