import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/features/goals/data/models/goal_model.dart';
import 'package:film_fount/features/search/data/models/movie_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GoalDatasource {
  final FirebaseDatabase database;
  final FirebaseAuth auth;

  GoalDatasource({required this.database, required this.auth});

  Future<bool> addGoal(GoalModel goal) async {
    final user = auth.currentUser;
    final DatabaseReference goalsRef = database.ref('${user!.uid}/goals');

    try {
      goalsRef.push().set({
        'id': goal.id,
        'title': goal.title,
        'description': goal.description,
        'createdAt': goal.createdAt.toIso8601String(),
        'deadline': goal.deadline.toIso8601String(),
        'isCompleted': goal.isCompleted,
        'movies': goal.movies,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<GoalModel>> getGoals() async {
    final user = auth.currentUser;
    final DatabaseReference goalsRef = database.ref('${user!.uid}/goals');

    try {
      final snapshot = await goalsRef.get();
      if (snapshot.exists) {
        final goalsData = snapshot.value as Map;
        final List<GoalModel> goals = goalsData.entries.map((entry) {
          final data = entry.value as Map;
          return GoalModel(
            id: data['id'].toString().orEmpty,
            title: (data['title']?.toString()).orEmpty,
            description: data['description']?.toString().orEmpty,
            createdAt: DateTime.parse(data['createdAt']),
            deadline: DateTime.parse(data['deadline']),
            isCompleted: data['isCompleted'] == true,
            movies: (data['movies'] as List<dynamic>? ?? []).map((e) {
              return MovieModel(
                id: int.tryParse(e['id'].toString()) ?? 0,
                title: e['title']?.toString(),
                posterPath: e['posterPath']?.toString(),
              );
            }).toList(),
          );
        }).toList();
        return goals;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Erro ao carregar metas: $e');
    }
  }

  Future<bool> updateGoal(GoalModel goal) async {
    final user = auth.currentUser;
    final DatabaseReference goalsRef = database.ref('${user!.uid}/goals');

    try {
      goalsRef.update({
        'id': goal.id,
        'title': goal.title,
        'description': goal.description,
        'createdAt': goal.createdAt.toIso8601String(),
        'deadline': goal.deadline.toIso8601String(),
        'isCompleted': goal.isCompleted,
        'movies': goal.movies,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteGoal(String id) async {
    final user = auth.currentUser;
    final DatabaseReference goalsRef = database.ref('${user!.uid}/goals');

    try {
      goalsRef.child(id).remove();
      return true;
    } catch (e) {
      return false;
    }
  }
}
