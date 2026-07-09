import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/domain/usecases/search_movie_usecase.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSearchNotifier extends StateNotifier<AppState<List<MovieEntity>>> {
  final SearchMovieUseCase _searchMovieUseCase;

  MovieSearchNotifier(this._searchMovieUseCase) : super(AppState.initial());

  String currentQuery = '';
  int queryPage = 1;
  bool isMoreMovies = true;

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) return;
    queryPage = 1;
    currentQuery = query;
    state = AppState.loading();
    try {
      final movies = await _searchMovieUseCase(query, queryPage);
      isMoreMovies = movies.isNotEmpty;
      state = AppState.data(movies);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<bool> loadSearchNextPage() async {
    queryPage++;
    final newMovies = await _searchMovieUseCase(
      currentQuery,
      queryPage,
    );
    if (newMovies.isEmpty) {
      isMoreMovies = false;
    } else {
      state.maybeWhen(
        data: (movies) {
          final updatedList = [...movies, ...newMovies];

          state = AppState.data(updatedList);
        },
        orElse: () {},
      );
    }
    return isMoreMovies;
  }
}
