import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';
import 'package:film_fount/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AuthRepository _authRepository;

  ProfileRepositoryImpl(this._authRepository);

  @override
  Future<UserEntity?> getUserEntity() async {
    return _authRepository.getCurrentUser();
  }

  @override
  Future<void> deleteAccount() async {
    return _authRepository.deleteAccount();
  }
}
