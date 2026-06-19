import 'package:fpdart/fpdart.dart';

import '../entities/auth_session_entity.dart';

abstract class AuthRepository {
  Future<Either<AuthSessionEntity, Exception>> signInGoogle();
  Future<Either<void, Exception>> logout();
}
