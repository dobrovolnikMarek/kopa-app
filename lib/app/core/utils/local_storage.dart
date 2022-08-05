import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final _storage = GetStorage();

  static Future init() async {
    await GetStorage.init();
  }

  static bool hasData(String key) {
    return GetStorage().hasData(key);
  }

  static Future<T?> read<T>(String key) async {
    return GetStorage().read<T>(key);
  }

  static write(String key, dynamic value) async {
    return await GetStorage().write(key, value);
  }

  static void writeIfNull(String key, dynamic value) {
    GetStorage().writeIfNull(key, value);
  }

  void erase() {
    _storage.erase();
  }

  static void remove(String key) {
    GetStorage().remove(key);
  }
}
