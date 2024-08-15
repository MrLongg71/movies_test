import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageUtil {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  // static final SecureStorageUtils instance = SecureStorageUtils._internal();
  //
  // SecureStorageUtils._internal();

  Future<void> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readValue(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteValue(String key) async {
    return await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    return await storage.deleteAll();
  }
}
