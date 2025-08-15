import 'package:dio/dio.dart';
import 'package:learning_language_app/const/utils/json_loader.dart';

import '../models/profile/profile_model.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<String> uploadImage(MultipartFile filePath);
  Future<ProfileModel> updateProfile(Map<String, dynamic> data);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    try {
      final result = await JsonLoader.load("assets/data/profile.json");
      return ProfileModel.fromJson(result as Map<String, dynamic>);
    } on UnimplementedError {
      rethrow;
    }
  }

  @override
  Future<String> uploadImage(MultipartFile file) async {
    try {
      return "https://raw.githubusercontent.com/hizurk1/vocaday_app/refs/heads/main/assets/images/logo.png?file=${file.filename}";
    } on UnimplementedError {
      rethrow;
    }
  }

  @override
  Future<ProfileModel> updateProfile(Map<String, dynamic> data) async {
    try {
      final result = ProfileModel.fromJson(data).toJson();
      return ProfileModel.fromJson(result);
    } on UnimplementedError {
      rethrow;
    }
  }
}
