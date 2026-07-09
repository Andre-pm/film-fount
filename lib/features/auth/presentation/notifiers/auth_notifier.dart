import 'dart:async';

import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:film_fount/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:film_fount/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends AsyncNotifier<bool> {
  late final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  late final SignOutUseCase _signOutUseCase;

  @override
  FutureOr<bool> build() {
    _loginWithGoogleUseCase = ref.watch(loginWithGoogleUseCaseProvider);
    _signOutUseCase = ref.watch(signOutUseCaseProvider);
    return false;
  }

  Future<bool> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      return await _loginWithGoogleUseCase();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  Future<bool> signOut() async {
    state = const AsyncValue.loading();
    try {
      return await _signOutUseCase();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
