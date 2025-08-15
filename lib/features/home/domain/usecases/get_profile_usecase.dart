import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileUsecase extends UsecaseNoParam<ProfileEntity> {
  final ProfileRepository _repository;

  GetProfileUsecase(this._repository);

  @override
  Future<Either<ProfileEntity, Exception>> call() {
    return _repository.getProfile();
  }
}