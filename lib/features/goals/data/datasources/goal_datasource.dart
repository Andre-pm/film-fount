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
        'title': goal.title,
        'description': goal.description,
        'createdAt': goal.createdAt.toIso8601String(),
        'deadline': goal.deadline.toIso8601String(),
        'isCompleted': goal.isCompleted,
        'isPublic': goal.isPublic,
        'movies': goal.movies.map((m) => m.toJson()).toList(),
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
            title: (data['title']?.toString()).orEmpty,
            description: data['description']?.toString().orEmpty,
            createdAt: DateTime.parse(data['createdAt']),
            deadline: DateTime.parse(data['deadline']),
            isCompleted: data['isCompleted'] == true,
            isPublic: data['isPublic'] == true,
            movies: (data['movies'] as List<dynamic>? ?? []).map((e) {
              return MovieModel.fromJson(Map<String, dynamic>.from(e));
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
        'title': goal.title,
        'description': goal.description,
        'createdAt': goal.createdAt.toIso8601String(),
        'deadline': goal.deadline.toIso8601String(),
        'isCompleted': goal.isCompleted,
        'isPublic': goal.isPublic,
        'movies': goal.movies.map((m) => m.toJson()).toList(),
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
