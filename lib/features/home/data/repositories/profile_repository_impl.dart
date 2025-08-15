import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/profile_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSources;

  ProfileRepositoryImpl(this._dataSources);

  @override
  Future<Either<ProfileEntity, Exception>> getProfile() async {
    try {
      final profileModel = await _dataSources.getProfile();
      return Left(ProfileEntity.fromModel(profileModel));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<String, Exception>> uploadImage(MultipartFile file) async {
    try {
      final path = await _dataSources.uploadImage(file);
      return Left(path);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<ProfileEntity, Exception>> updateProfile(
    ProfileEntity profile,
  ) async {
    try {
      final updatedProfile = await _dataSources.updateProfile(profile.toMap());
      return Left(ProfileEntity.fromModel(updatedProfile));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
