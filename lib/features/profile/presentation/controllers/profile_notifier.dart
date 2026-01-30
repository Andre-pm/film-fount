import 'dart:ui';

import 'package:film_fount/core/presentation/extensions/string_extensions.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_riverpod/legacy.dart';

class ProfileNotifier extends StateNotifier<AppState<UserEntity>> {
  final ProfileRepository _profileRepository;
  final LibraryRepository _libraryRepository;

  ProfileNotifier(this._profileRepository, this._libraryRepository)
    : super(const AppState.initial()) {
    fetchUser();
  }

  UserEntity? _localUser;

  Future<void> fetchUser() async {
    state = AppState.loading();
    try {
      _localUser != null
          ? state = AppState.data(_localUser!)
          : _localUser = await _profileRepository.getUserEntity();
      state = AppState.data(_localUser!);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> deleteAccount(VoidCallback onSuccess) async {
    state = AppState.loading();

    try {
      await _libraryRepository.deleteLibrary((_localUser?.uid).orEmpty);
      await _profileRepository.deleteAccount();

      state = const AppState.initial();
      onSuccess();
    } catch (e) {
      state = AppState.error(e);
    }
  }
}
