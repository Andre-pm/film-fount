import 'package:film_fount/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';

extension MovieDetailsMapper on MovieDetailModel {
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle == title ? null : originalTitle,
      overview: overview == '' ? null : overview,
      posterPath: posterPath != null
          ? 'https://image.tmdb.org/t/p/original$posterPath'
          : null,
      title: title,
      backdropPath: backdropPath != null
          ? 'https://image.tmdb.org/t/p/original$backdropPath'
          : null,
      genres: genres?.map((genre) => genre).toList(),
      homepage: homepage,
      releaseDate: releaseDate,
      status: getStatus(status),
      runtime: formatToMinutes(runtime ?? 0),
      isInWatchList: isOnWatchList ?? false,
      isWatched: isWatched ?? false,
    );
  }
}

MovieStatus getStatus(String? status) {
  switch (status) {
    case 'Released':
      return MovieStatus.released;
    case 'Production':
      return MovieStatus.production;
    default:
      return MovieStatus.unknown;
  }
}

String? formatToMinutes(int totalMinutes) {
  int hours = totalMinutes ~/ 60;

  int minutes = totalMinutes % 60;

  String formattedHours = hours.toString().padLeft(2, '0');
  String formattedMinutes = minutes.toString().padLeft(2, '0');

  if (hours > 0) {
    return '${formattedHours}h ${formattedMinutes}min';
  } else if (minutes > 0) {
    return '${formattedMinutes}min';
  } else {
    return null;
  }
}
