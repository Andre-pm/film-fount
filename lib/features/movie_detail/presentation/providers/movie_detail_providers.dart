import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/library/data/respositories/library_repository_impl.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/library/domain/usecases/add_to_watch_list_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/firebase_watch_list_content_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/remove_from_watch_list_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/update_watched_usecase.dart';
import 'package:film_fount/features/library/presentation/providers/library_providers.dart';
import 'package:film_fount/features/movie_detail/data/datasources/movie_detail_datasource.dart';
import 'package:film_fount/features/movie_detail/data/repositories/the_movie_detail_repository_impl.dart';
import 'package:film_fount/features/movie_detail/domain/entities/movie_detail_entity.dart';
import 'package:film_fount/features/movie_detail/domain/repositories/the_movie_detail_repository.dart';
import 'package:film_fount/features/movie_detail/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_fount/features/movie_detail/domain/usecases/get_recommendations_usecase.dart';
import 'package:film_fount/features/movie_detail/domain/usecases/get_similar_movies_usecase.dart';
import 'package:film_fount/features/movie_detail/presentation/notifiers/movie_detail_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailDatasourceProvider = Provider<MovieDetailDatasource>(
  (ref) => MovieDetailDatasource(
    client: ref.watch(dioProvider),
    auth: ref.watch(firebaseAuthProvider),
    database: ref.watch(firebaseDatabaseProvider),
  ),
);

final theMovieDetailRepositoryProvider = Provider<TheMovieDetailRepository>(
  (ref) =>
      TheMovieDetailRepositoryImpl(ref.watch(movieDetailDatasourceProvider)),
);

final libraryRepositoryProvider = Provider<LibraryRepository>(
  (ref) => LibraryRepositoryImpl(ref.watch(libraryDatasourceProvider)),
);

final getMovieDetailsUseCaseProvider = Provider<GetMovieDetailsUseCase>((ref) => GetMovieDetailsUseCase(ref.watch(theMovieDetailRepositoryProvider)));
final getSimilarMoviesUseCaseProvider = Provider<GetSimilarMoviesUseCase>((ref) => GetSimilarMoviesUseCase(ref.watch(theMovieDetailRepositoryProvider)));
final getRecommendationsUseCaseProvider = Provider<GetRecommendationsUseCase>((ref) => GetRecommendationsUseCase(ref.watch(theMovieDetailRepositoryProvider)));
final firebaseWatchListContentUseCaseProvider = Provider<FirebaseWatchListContentUseCase>((ref) => FirebaseWatchListContentUseCase(ref.watch(libraryRepositoryProvider)));
final addToWatchListUseCaseProvider = Provider<AddToWatchListUseCase>((ref) => AddToWatchListUseCase(ref.watch(libraryRepositoryProvider)));
final removeFromWatchListUseCaseProvider = Provider<RemoveFromWatchListUseCase>((ref) => RemoveFromWatchListUseCase(ref.watch(libraryRepositoryProvider)));
final updateWatchedUseCaseProvider = Provider<UpdateWatchedUseCase>((ref) => UpdateWatchedUseCase(ref.watch(libraryRepositoryProvider)));


final movieDetailNotifierProvider =
    StateNotifierProvider.family<
      MovieDetailNotifier,
      AppState<MovieDetailEntity>,
      int
    >((ref, movieId) {
      return MovieDetailNotifier(
        ref.watch(getMovieDetailsUseCaseProvider),
        ref.watch(getSimilarMoviesUseCaseProvider),
        ref.watch(getRecommendationsUseCaseProvider),
        ref.watch(firebaseWatchListContentUseCaseProvider),
        ref.watch(addToWatchListUseCaseProvider),
        ref.watch(removeFromWatchListUseCaseProvider),
        ref.watch(updateWatchedUseCaseProvider),
        movieId,
        ref.watch(eventBusProvider),
      );
    });
