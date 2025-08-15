import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<ProfileEntity, Exception>> getProfile();
  Future<Either<String, Exception>> uploadImage(MultipartFile file);
  Future<Either<ProfileEntity, Exception>> updateProfile(ProfileEntity profile);
}
