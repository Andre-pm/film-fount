import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/library/data/models/library_movie_model.dart';
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
      throw Exception('Não há filmes na biblioteca ainda');
    }
  }
}
