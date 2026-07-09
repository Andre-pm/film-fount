import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

class IsUserLoggedUseCase {
  final AuthRepository repository;

  IsUserLoggedUseCase(this.repository);

  Stream<UserEntity?> call() {
    return repository.isUserLogged;
  }
}
