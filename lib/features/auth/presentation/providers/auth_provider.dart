import 'package:film_fount/core/presentation/providers/core_providers.dart';
import 'package:film_fount/features/auth/data/datasources/auth_datasource.dart';
import 'package:film_fount/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';
import 'package:film_fount/features/auth/domain/usecases/is_user_logged_usecase.dart';
import 'package:film_fount/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:film_fount/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:film_fount/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:film_fount/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasource(ref.watch(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authDatasourceProvider));
});

final isUserLoggedUseCaseProvider = Provider<IsUserLoggedUseCase>((ref) {
  return IsUserLoggedUseCase(ref.watch(authRepositoryProvider));
});

final loginWithGoogleUseCaseProvider = Provider<LoginWithGoogleUseCase>((ref) {
  return LoginWithGoogleUseCase(ref.watch(authRepositoryProvider));
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(authRepositoryProvider));
});

final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ref) {
  return DeleteAccountUseCase(ref.watch(authRepositoryProvider));
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

final authStateProvider = StreamProvider<UserEntity?>((ref) {
  return ref.watch(isUserLoggedUseCaseProvider).call();
});

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, bool>(
  AuthNotifier.new,
);
