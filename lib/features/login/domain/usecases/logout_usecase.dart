import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../repositories/auth_repository.dart';

class LogoutUsecase extends UsecaseNoParam<void> {
  LogoutUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<void, Exception>> call() => _repository.logout();
}
