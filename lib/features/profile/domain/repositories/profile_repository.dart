import 'package:film_fount/features/auth/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity?> getUserEntity();
  Future<void> deleteAccount();
}
