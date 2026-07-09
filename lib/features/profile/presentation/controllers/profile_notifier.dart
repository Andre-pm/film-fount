import 'dart:ui';

import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:film_fount/features/library/domain/usecases/delete_library_usecase.dart';
import 'package:film_fount/features/profile/domain/usecases/get_user_entity_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<AppState<UserEntity>> {
  final GetUserEntityUseCase _getUserEntityUseCase;
  final DeleteLibraryUseCase _deleteLibraryUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  ProfileNotifier(
    this._getUserEntityUseCase,
    this._deleteLibraryUseCase,
    this._deleteAccountUseCase,
  ) : super(const AppState.initial()) {
    fetchUser();
  }

  UserEntity? _localUser;

  Future<void> fetchUser() async {
    state = AppState.loading();
    try {
      _localUser != null
          ? state = AppState.data(_localUser!)
          : _localUser = await _getUserEntityUseCase();
      state = AppState.data(_localUser!);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> deleteAccount(VoidCallback onSuccess) async {
    state = AppState.loading();

    try {
      await _deleteLibraryUseCase((_localUser?.uid).orEmpty);
      await _deleteAccountUseCase();

      state = const AppState.initial();
      onSuccess();
    } catch (e) {
      state = AppState.error(e);
    }
  }
}
