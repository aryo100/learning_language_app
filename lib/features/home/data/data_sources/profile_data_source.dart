import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import '../models/profile/profile_model.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<String> uploadImage(MultipartFile filePath);
  Future<ProfileModel> updateProfile(Map<String, dynamic> data);
}

class ProfileDataSourceImpl extends BaseDataSource implements ProfileDataSource {
  ProfileDataSourceImpl() : super(networkDio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(NetworkConstants.profile);
      return ProfileModel.fromJson(response.data as Map<String, dynamic>);
    } on UnimplementedError {
      rethrow;
    }
  }

  @override
  Future<String> uploadImage(MultipartFile file) async {
    try {
      // Example of using network service for upload
      // final response = await dio.post(
      //   NetworkConstants.profile,
      //   data: FormData.fromMap({'image': file}),
      // );
      // return response.data['imageUrl'];
      
      // For now, return mock URL
      return "https://raw.githubusercontent.com/hizurk1/vocaday_app/refs/heads/main/assets/images/logo.png?file=${file.filename}";
    } on UnimplementedError {
      rethrow;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<ProfileModel> updateProfile(Map<String, dynamic> data) async {
    try {
      // Example of using network service for update
      // final response = await dio.put(
      //   NetworkConstants.profile,
      //   data: data,
      // );
      // return ProfileModel.fromJson(response.data);
      
      // For now, return mock data
      final result = ProfileModel.fromJson(data).toJson();
      return ProfileModel.fromJson(result);
    } on UnimplementedError {
      rethrow;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
