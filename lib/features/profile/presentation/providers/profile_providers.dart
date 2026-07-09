import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/auth/data/datasources/auth_datasource.dart';
import 'package:film_fount/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';
import 'package:film_fount/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:film_fount/features/library/data/respositories/library_repository_impl.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:film_fount/features/library/domain/usecases/delete_library_usecase.dart';
import 'package:film_fount/features/library/presentation/providers/library_providers.dart';
import 'package:film_fount/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:film_fount/features/profile/domain/repositories/profile_repository.dart';
import 'package:film_fount/features/profile/domain/usecases/get_user_entity_usecase.dart';
import 'package:film_fount/features/profile/presentation/controllers/profile_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasource(ref.watch(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authDatasourceProvider));
});

final getProfileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ref.watch(authRepositoryProvider));
});

final libraryRepositoryProvider = Provider<LibraryRepository>(
  (ref) => LibraryRepositoryImpl(ref.watch(libraryDatasourceProvider)),
);

final getUserEntityUseCaseProvider = Provider<GetUserEntityUseCase>((ref) => GetUserEntityUseCase(ref.watch(getProfileRepositoryProvider)));
final deleteLibraryUseCaseProvider = Provider<DeleteLibraryUseCase>((ref) => DeleteLibraryUseCase(ref.watch(libraryRepositoryProvider)));
final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ref) => DeleteAccountUseCase(ref.watch(authRepositoryProvider)));

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, AppState<UserEntity>>((ref) {
      return ProfileNotifier(
        ref.watch(getUserEntityUseCaseProvider),
        ref.watch(deleteLibraryUseCaseProvider),
        ref.watch(deleteAccountUseCaseProvider),
      );
    });
