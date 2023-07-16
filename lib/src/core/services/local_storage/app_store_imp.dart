import 'package:shared_preferences/shared_preferences.dart';

import 'app_store.dart';

class AppStorageImp extends AppStorageI {
  static Future<SharedPreferences> getPrefs() async {
    return SharedPreferences.getInstance();
  }

  static const String _keyOnBoardingStatus = 'on_boarding_status';
  static const String _keyBearerToken = 'bearer_token';
  static const String _keyCredentials = 'credentials';

  @override
  Future<void> setOnBoardingStatus(bool status) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setBool(_keyOnBoardingStatus, status);
  }

  @override
  Future<bool?> getOnBoardingStatus() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getBool(_keyOnBoardingStatus);
  }


  @override
  Future<void> storeBearerToken(String token) async{
    SharedPreferences prefs = await getPrefs();
    prefs.setString(_keyBearerToken, token);
  }

  @override
  Future<String?> retrieveBearerToken() async{
    SharedPreferences prefs = await getPrefs();
    return prefs.getString(_keyBearerToken);
  }

  @override
  Future<Map<String, dynamic>?> retrieveCredentials() {
    // TODO: implement retrieveCredentials
    throw UnimplementedError();
  }

  @override
  Future<void> storeCredentials(Map<String, dynamic> credentials) {
    // TODO: implement storeCredentials
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }
}
