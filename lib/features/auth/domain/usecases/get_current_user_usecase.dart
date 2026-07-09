import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  UserEntity? call() {
    return repository.getCurrentUser();
  }
}
