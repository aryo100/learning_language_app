import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import 'package:learning_language_app/features/home/domain/entities/profile_entity.dart';

import '../repositories/profile_repository.dart';

class UpdateProfileUsecase extends Usecase<ProfileEntity, ProfileEntity> {
  final ProfileRepository _repository;

  UpdateProfileUsecase(this._repository);

  @override
  Future<Either<ProfileEntity, Exception>> call(params) {
    return _repository.updateProfile(params);
  }
}