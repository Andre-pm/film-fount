import 'package:film_fount/features/home/data/repositories/tmdb_repository.dart';
import 'package:film_fount/features/home/data/repositories/tmdb_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tmdbRepositoryProvider = Provider<TMDBRepository>(
  (ref) => TMDBRepositoryImpl(),
);
