

import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../repositories/auth_repository.dart';

class SignInGoogleUsecase extends UsecaseNoParam<String> {
  final AuthRepository _repository;

  SignInGoogleUsecase(this._repository);

  @override
  Future<Either<String, Exception>> call() {
    return _repository.signInGoogle();
  }
}