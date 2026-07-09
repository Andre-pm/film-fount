import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/profile/domain/repositories/profile_repository.dart';

class GetUserEntityUseCase {
  final ProfileRepository repository;

  GetUserEntityUseCase(this.repository);

  Future<UserEntity?> call() {
    return repository.getUserEntity();
  }
}
