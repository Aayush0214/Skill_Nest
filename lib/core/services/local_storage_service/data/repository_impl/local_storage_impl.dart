import '../../domain/repository/local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageImpl implements LocalStorage {

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  @override
  Future<void> writeData({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> readData({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> deleteData({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return await _storage.containsKey(key: key);
  }

  @override
  Future<Map<String, String>> readAllData() async {
    return await _storage.readAll();
  }
}