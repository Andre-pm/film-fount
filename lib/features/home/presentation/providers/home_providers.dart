import 'package:dio/dio.dart';
import 'package:film_fount/features/home/data/datasources/the_movie_database_source.dart';
import 'package:film_fount/features/home/data/repositories/the_movie_database_repository_impl.dart';
import 'package:film_fount/features/home/domain/repositories/the_movie_database_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final theMovieDatabaseSourceProvider = Provider<TheMovieDatabaseSource>(
  (ref) => TheMovieDatabaseSource(client: ref.watch(dioProvider)),
);

final theMovieDatabaseRepositoryProvider = Provider<TheMovieDatabaseRepository>(
  (ref) =>
      TheMovieDatabaseRepositoryImpl(ref.watch(theMovieDatabaseSourceProvider)),
);
