import 'dart:async';

import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, bool>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<bool> {
  late final AuthRepository _repository;

  @override
  FutureOr<bool> build() {
    _repository = ref.watch(authRepositoryProvider);
    return false;
  }

  Future<bool> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      return await _repository.loginWithGoogle();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> signOut() async {
    state = const AsyncValue.loading();
    try {
      return await _repository.signOut();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
