import 'package:film_fount/features/auth/presentation/auth_wrapper.dart';
import 'package:film_fount/features/auth/presentation/screens/login_screen.dart';
import 'package:film_fount/features/goals/presentation/screens/goal_deadline.dart';
import 'package:film_fount/features/goals/presentation/screens/goal_movie_selection.dart';
import 'package:film_fount/features/goals/presentation/screens/goal_screen.dart';
import 'package:film_fount/features/library/presentation/screens/library_screen.dart';
import 'package:film_fount/features/profile/presentation/screens/profile_screen.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:film_fount/features/search/presentation/screens/search_screen.dart';
import 'package:film_fount/features/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const initialRoute = '/';
  static const login = '/login';
  static const search = '/search';
  static const movieDetails = '/movie_details';
  static const profile = '/profile';
  static const goals = '/goals';
  static const library = '/library';
  static const createNewGoal = '/create_goal';
  static const goalDeadline = '/goal_deadline';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return FadeRoute(widget: AuthWrapper());
      case login:
        return FadeRoute(widget: LoginScreen());
      case search:
        return FadeRoute(widget: SearchScreen());
      case movieDetails:
        final movieId = settings.arguments as int?;
        return FadeRoute(widget: MovieDetailScreen(movieId: movieId ?? 0));
      case profile:
        return FadeRoute(widget: ProfileScreen());

      case goals:
        return FadeRoute(widget: GoalScreen());
      case goalDeadline:
        return FadeRoute(
          widget: GoalDeadline(
            selectedMovies: settings.arguments as List<MovieEntity>,
          ),
        );
      case createNewGoal:
        return FadeRoute(widget: GoalMovieSelection());
      case library:
        return FadeRoute(widget: LibraryScreen());
      default:
        return FadeRoute(widget: AuthWrapper());
    }
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget widget;

  FadeRoute({required this.widget})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
}
