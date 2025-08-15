import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../repositories/profile_repository.dart';

class UploadImageUsecase extends Usecase<String, MultipartFile> {
  final ProfileRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<String, Exception>> call(params) {
    return _repository.uploadImage(params);
  }
}