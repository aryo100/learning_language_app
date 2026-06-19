import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/core/api/json_helpers.dart';

import '../models/profile/profile_model.dart';

abstract final class _ProfileEndpoints {
  static const profile = '/profile';
  static const avatar = '/profile/avatar';
}

abstract interface class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<String> uploadImage(MultipartFile file);
  Future<ProfileModel> updateProfile(Map<String, dynamic> data);
}

class ProfileDataSourceImpl extends BaseDataSource implements ProfileDataSource {
  ProfileDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(_ProfileEndpoints.profile);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<String> uploadImage(MultipartFile file) async {
    try {
      final formData = FormData.fromMap({'file': file});
      final response = await dio.post(
        _ProfileEndpoints.avatar,
        data: formData,
      );
      final data = response.data as Map<String, dynamic>;
      return jsonString(data, 'photo_url', 'photoUrl');
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<ProfileModel> updateProfile(Map<String, dynamic> data) async {
    try {
      final response =
          await dio.patch(_ProfileEndpoints.profile, data: data);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
