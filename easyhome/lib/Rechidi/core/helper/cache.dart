import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return _sharedPreferences!.getString(key);
  }

  static Future<bool> setString(String key, String value) {
    return _sharedPreferences!.setString(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences!.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return _sharedPreferences!.setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    return await _sharedPreferences!.remove(key);
  }
}

class AuthCache {
  static String? get token => SharedPrefHelper.getString('TOKEN');
  static String? get userId => SharedPrefHelper.getString('USER_ID');
  static bool get isWorker => SharedPrefHelper.getBool('IS_WORKER') ?? false;

  static Future<void> setIsWorker(bool isWorker) async =>
      await SharedPrefHelper.setBool('IS_WORKER', isWorker);

  static Future<void> setUserId(String userId) async =>
      await SharedPrefHelper.setString('USER_ID', userId);

  static Future<void> setToken(String token) async =>
      await SharedPrefHelper.setString('TOKEN', token);

  static Future<void> removeToken() async =>
      await SharedPrefHelper.remove('TOKEN');

  static Future<void> removeUserId() async =>
      await SharedPrefHelper.remove('USER_ID');

  static Future<void> logOut() async {
    await removeToken();
    await removeUserId();
  }
}
