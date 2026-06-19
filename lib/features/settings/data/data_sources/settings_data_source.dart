import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/core/api/json_helpers.dart';

abstract final class _SettingsEndpoints {
  static const userSettings = '/user/settings';
}

class UserSettingsModel {
  const UserSettingsModel({
    required this.notificationsEnabled,
    required this.dailyReminderEnabled,
    this.dailyReminderTime = '09:00',
    this.language = 'en',
  });

  final bool notificationsEnabled;
  final bool dailyReminderEnabled;
  final String dailyReminderTime;
  final String language;

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) {
    return UserSettingsModel(
      notificationsEnabled:
          jsonBool(json, 'notifications_enabled', 'notificationsEnabled'),
      dailyReminderEnabled: jsonBool(
        json,
        'daily_reminder_enabled',
        'dailyReminderEnabled',
        fallback: jsonBool(
          json,
          'notifications_enabled',
          'notificationsEnabled',
        ),
      ),
      dailyReminderTime: jsonString(
        json,
        'daily_reminder_time',
        'dailyReminderTime',
        fallback: '09:00',
      ),
      language: jsonString(json, 'language', 'language', fallback: 'en'),
    );
  }
}

abstract interface class SettingsDataSource {
  Future<UserSettingsModel> getSettings();
  Future<UserSettingsModel> updateSettings(Map<String, dynamic> data);
}

class SettingsDataSourceImpl extends BaseDataSource
    implements SettingsDataSource {
  SettingsDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<UserSettingsModel> getSettings() async {
    try {
      final response = await dio.get(_SettingsEndpoints.userSettings);
      return UserSettingsModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<UserSettingsModel> updateSettings(Map<String, dynamic> data) async {
    try {
      final response =
          await dio.patch(_SettingsEndpoints.userSettings, data: data);
      return UserSettingsModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
