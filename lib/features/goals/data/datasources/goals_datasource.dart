import 'package:film_fount/features/goals/data/models/goal_model.dart';
import 'package:film_fount/features/library/data/models/library_movie_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GoalsDatasource {
  final FirebaseDatabase database;
  final FirebaseAuth auth;

  GoalsDatasource({required this.database, required this.auth});

  Future<List<GoalModel>> getGoals() async {
    final user = auth.currentUser;

    final DatabaseReference goalsRef = database.ref('${user!.uid}/goals');

    final snapshot = await goalsRef.get();

    if (snapshot.exists) {
      final goalsData = snapshot.value as Map;
      final List<GoalModel> goals = goalsData.entries.map((entry) {
        final data = entry.value as Map;

        return GoalModel(
          id: int.tryParse(data['id'].toString()) ?? 0,
          title: data['title']?.toString(),
          daysTarget: int.tryParse(data['daysTarget'].toString()),
          initialDate: DateTime.tryParse(data['initialDate']),
          conclusionDate: DateTime.tryParse(data['conclusionDate']),
          completed: data['completed'] == true,
          movies: data['movies'] != null
              ? (data['movies'] as List).map((movieData) {
                  final movieMap = movieData as Map;
                  return LibraryMovieModel(
                    id: int.tryParse(movieMap['id'].toString()) ?? 0,
                    title: movieMap['title']?.toString(),
                    posterPath: movieMap['posterPath']?.toString(),
                    watched: movieMap['watched'] == true,
                  );
                }).toList()
              : [],
        );
      }).toList();
      return goals;
    } else {
      return [];
    }
  }
}
