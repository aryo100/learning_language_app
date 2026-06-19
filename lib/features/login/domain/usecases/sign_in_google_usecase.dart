import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class SignInGoogleUsecase extends UsecaseNoParam<AuthSessionEntity> {
  final AuthRepository _repository;

  SignInGoogleUsecase(this._repository);

  @override
  Future<Either<AuthSessionEntity, Exception>> call() {
    return _repository.signInGoogle();
  }
}
