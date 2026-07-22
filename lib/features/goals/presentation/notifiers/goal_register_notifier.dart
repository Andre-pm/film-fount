import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/domain/usecases/search_movie_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalRegisterState {
  final bool isLoading;
  final List<MovieEntity> movies;
  final List<MovieEntity> selectedMovies;
  final String? error;

  GoalRegisterState({
    this.isLoading = false,
    this.movies = const [],
    this.selectedMovies = const [],
    this.error,
  });

  GoalRegisterState copyWith({
    bool? isLoading,
    List<MovieEntity>? movies,
    List<MovieEntity>? selectedMovies,
    String? error,
  }) {
    return GoalRegisterState(
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      selectedMovies: selectedMovies ?? this.selectedMovies,
      error: error,
    );
  }
}

class GoalRegisterNotifier extends StateNotifier<GoalRegisterState> {
  final SearchMovieUseCase _searchMovieUseCase;

  GoalRegisterNotifier(this._searchMovieUseCase) : super(GoalRegisterState());

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) {
      state = state.copyWith(movies: [], isLoading: false);
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final movies = await _searchMovieUseCase(query, 1);
      state = state.copyWith(isLoading: false, movies: movies);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void addMovie(MovieEntity movie) {
    if (!state.selectedMovies.any((m) => m.id == movie.id)) {
      state = state.copyWith(
        selectedMovies: [...state.selectedMovies, movie],
      );
    }
  }

  void removeMovie(MovieEntity movie) {
    state = state.copyWith(
      selectedMovies: state.selectedMovies.where((m) => m.id != movie.id).toList(),
    );
  }
}
