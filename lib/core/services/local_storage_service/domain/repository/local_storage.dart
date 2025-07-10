abstract class LocalStorage {
  Future<void> writeData({required String key, required String value});
  Future<String?> readData({required String key});
  Future<void> deleteData({required String key});
  Future<void> deleteAllData();
  Future<bool> containsKey({required String key});
  Future<Map<String, String>> readAllData();
}