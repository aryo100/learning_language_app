import 'package:learning_language_app/const/prefs_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final SharedPreferences _prefs;

  SharedPref(this._prefs);

  Future<void> saveEmail(String email) async {
    await _prefs.setString(PrefsKey.userEmail, email);
  }

  String? get getEmail => _prefs.getString(PrefsKey.userEmail);

  Future<void> saveUserLogin() async {
    await _prefs.setBool(PrefsKey.userLogin, true);
  }

  Future<void> saveUserLogout() async {
    await _prefs.setBool(PrefsKey.userLogin, false);
    await _prefs.remove(PrefsKey.userEmail);
    await clearTokens();
  }

  bool get isUserLogin =>
      _prefs.getBool(PrefsKey.userLogin) ?? false;

  String? get accessToken => _prefs.getString(PrefsKey.accessToken);

  String? get refreshToken => _prefs.getString(PrefsKey.refreshToken);

  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _prefs.setString(PrefsKey.accessToken, accessToken);
    if (refreshToken != null) {
      await _prefs.setString(PrefsKey.refreshToken, refreshToken);
    }
  }

  Future<void> clearTokens() async {
    await _prefs.remove(PrefsKey.accessToken);
    await _prefs.remove(PrefsKey.refreshToken);
  }

  String? getString(String key) => _prefs.getString(key);

  Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
