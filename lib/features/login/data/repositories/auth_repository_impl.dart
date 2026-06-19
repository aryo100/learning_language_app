import 'package:fpdart/fpdart.dart';

import 'package:learning_language_app/const/utils/shared_preferences.dart';

import '../../domain/entities/auth_session_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSources;
  final SharedPref _sharedPref;

  AuthRepositoryImpl(this._dataSources, this._sharedPref);

  @override
  Future<Either<AuthSessionEntity, Exception>> signInGoogle() async {
    try {
      final result = await _dataSources.signInGoogle();
      return Left(
        AuthSessionEntity(
          email: result.email,
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
          name: result.name,
        ),
      );
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> logout() async {
    try {
      await _dataSources.logout(refreshToken: _sharedPref.refreshToken);
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
