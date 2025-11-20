import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:film_fount/features/auth/presentation/views/login_screen.dart';
import 'package:film_fount/features/home/presentation/screens/home_screen.dart';
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
        return HomeScreen();
      },
      error: (_, _) {
        return const Scaffold(
          body: Center(
            child: Text('Erro ao verificar estado de autenticação.'),
          ),
        );
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
