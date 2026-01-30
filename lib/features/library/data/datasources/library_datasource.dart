import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/library/data/models/library_movie_model.dart';
import 'package:film_fount/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LibraryDatasource {
  final FirebaseDatabase database;
  final FirebaseAuth auth;

  LibraryDatasource({required this.database, required this.auth});

  Future<List<LibraryMovieModel>> getLibraryMovies() async {
    final user = auth.currentUser;

    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );

    final snapshot = await watchListRef.get();

    if (snapshot.exists) {
      final moviesData = snapshot.value as Map;
      final List<LibraryMovieModel> watchList = moviesData.entries.map((entry) {
        final data = entry.value as Map;

        return LibraryMovieModel(
          id: int.tryParse(data['id'].toString()) ?? 0,
          title: data['title']?.toString().orEmpty,
          posterPath: data['posterPath']?.toString().orEmpty,
          watched: data['watched'] == true,
        );
      }).toList();
      return watchList;
    } else {
      return [];
    }
  }

  Future<void> deleteLibrary(String userId) async {
    final user = auth.currentUser;

    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );

    await watchListRef.remove();
  }

  Future<bool> addToWatchList(MovieDetailModel movie) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    try {
      watchListRef.push().set({
        'id': movie.id,
        'title': movie.title,
        'posterPath': movie.posterPath,
        'watched': movie.isWatched ?? false,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFromWatchList(int id) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    final DataSnapshot snapshot = await watchListRef.get();
    if (snapshot.exists) {
      final watchList = snapshot.value as Map<dynamic, dynamic>;
      for (final entry in watchList.entries) {
        final movie = entry.value as Map<dynamic, dynamic>;
        if (movie['id'] == id) {
          await watchListRef.child(entry.key).remove();
          return true;
        }
      }
    }
    return false;
  }

  Future<MovieDetailModel> loadFirebaseWatchList(int movieId) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    bool? isOnWatchList;
    bool? isWatched;

    final DataSnapshot snapshot = await watchListRef.get();
    if (snapshot.exists) {
      final watchList = snapshot.value as Map<dynamic, dynamic>;
      for (final entry in watchList.entries) {
        final movie = entry.value as Map<dynamic, dynamic>;
        if (movie['id'] == movieId) {
          isOnWatchList = true;
          if (movie['watched'] == true) {
            isWatched = true;
          }
        }
      }
    }
    return MovieDetailModel(
      id: 0,
      isOnWatchList: isOnWatchList,
      isWatched: isWatched,
    );
  }

  Future<bool> changeWatched(int movieId, bool isWatched) async {
    final user = auth.currentUser;
    final DatabaseReference watchListRef = database.ref(
      '${user!.uid}/watchlist',
    );
    final DataSnapshot snapshot = await watchListRef.get();
    if (snapshot.exists) {
      final watchList = snapshot.value as Map<dynamic, dynamic>;
      for (final entry in watchList.entries) {
        final movie = entry.value as Map<dynamic, dynamic>;
        if (movie['id'] == movieId) {
          await watchListRef.child(entry.key).update({'watched': isWatched});
          return true;
        }
      }
    }
    return false;
  }
}
