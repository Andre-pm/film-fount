import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:film_fount/features/auth/presentation/screens/login_screen.dart';
import 'package:film_fount/features/library/presentation/screens/library_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (user) {
        if (user == null) {
          return LoginScreen();
        }
        return LibraryScreen();
      },
      error: (_, _) {
        return Scaffold(body: SizedBox.shrink());
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
