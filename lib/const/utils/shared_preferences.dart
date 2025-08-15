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
  }

  bool get isUserLogin =>
      _prefs.getBool(PrefsKey.userLogin) ?? false;

  // Cart Words methods
  String? getString(String key) => _prefs.getString(key);
  
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
  
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
