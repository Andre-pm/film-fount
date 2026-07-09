import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

class LoginWithGoogleUseCase {
  final AuthRepository repository;

  LoginWithGoogleUseCase(this.repository);

  Future<bool> call() {
    return repository.loginWithGoogle();
  }
}
