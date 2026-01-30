import 'package:film_fount/features/auth/data/datasources/auth_datasource.dart';
import 'package:film_fount/features/auth/data/mappers/user_mapper.dart';
import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<bool> loginWithGoogle() {
    return _datasource
        .loginWithGoogle()
        .then((_) => true)
        .catchError((_) => false);
  }

  @override
  UserEntity? getCurrentUser() {
    final user = _datasource.getCurrentUser();
    if (user == null) return null;
    return user.toEntity();
  }

  @override
  Stream<UserEntity?> get isUserLogged {
    return _datasource.isUserLogged.map((user) {
      if (user == null) return null;
      return user.toEntity();
    });
  }

  @override
  Future<bool> signOut() {
    return _datasource.signOut().then((_) => true).catchError((_) => false);
  }

  @override
  Future<void> deleteAccount() {
    return _datasource.deleteAccount();
  }
}
