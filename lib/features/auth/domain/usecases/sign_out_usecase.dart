import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<bool> call() {
    return repository.signOut();
  }
}
