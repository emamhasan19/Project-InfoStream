abstract class AppStorageI{
  Future<void> setOnBoardingStatus(bool status);
  Future<bool?> getOnBoardingStatus();
  Future<void> storeBearerToken(String token);
  Future<String?> retrieveBearerToken();
  Future<void> storeCredentials(Map<String, dynamic> credentials);
  Future<Map<String, dynamic>?> retrieveCredentials();
  Future<void> clear();
}