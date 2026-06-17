import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';

import '../models/profile/profile_model.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<String> uploadImage(MultipartFile filePath);
  Future<ProfileModel> updateProfile(Map<String, dynamic> data);
}

class ProfileDataSourceImpl extends BaseDataSource implements ProfileDataSource {
  ProfileDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(NetworkConstants.profile);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<String> uploadImage(MultipartFile file) async {
    try {
      return "https://raw.githubusercontent.com/hizurk1/vocaday_app/refs/heads/main/assets/images/logo.png?file=${file.filename}";
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<ProfileModel> updateProfile(Map<String, dynamic> data) async {
    try {
      final result = ProfileModel.fromJson(data).toJson();
      return ProfileModel.fromJson(result);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
