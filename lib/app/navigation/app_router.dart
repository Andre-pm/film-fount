import 'package:film_fount/features/auth/presentation/views/auth_wrapper.dart';
import 'package:film_fount/features/auth/presentation/views/login_screen.dart';
import 'package:film_fount/features/goals/presentation/screens/goal_screen.dart';
import 'package:film_fount/features/library/presentation/screens/library_screen.dart';
import 'package:film_fount/features/profile/presentation/screens/profile_screen.dart';
import 'package:film_fount/features/search/presentation/screens/search_screen.dart';
import 'package:film_fount/features/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:film_fount/features/goals/presentation/widgets/goal_detail_page.dart';
import 'package:film_fount/features/search/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const initialRoute = '/';
  static const login = '/login';
  static const search = '/search';
  static const movieDetails = '/movie_details';
  static const profile = '/profile';
  static const goals = '/goals';
  static const goalDetail = '/goal_detail';
  static const library = '/library';

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
      case goalDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final goalName = args?['goalName'] as String? ?? '';
        final selectedMovies =
            args?['selectedMovies'] as List<MovieEntity>? ?? [];
        return FadeRoute(
          widget: GoalDetailPage(
            goalName: goalName,
            selectedMovies: selectedMovies,
          ),
        );
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
