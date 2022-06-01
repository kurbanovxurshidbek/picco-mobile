import 'package:hive/hive.dart';

enum StorageKeys {
  LANGUAGE
}

class HiveService {
  static String DB_NAME = 'picco';
  static Box box = Hive.box(DB_NAME);

  static String key(StorageKeys key) {
    switch(key) {
      case StorageKeys.LANGUAGE: return 'language';
    }
  }

  /// FOR A STRING
  static Future<void> storeString (String key, String data) async {
    box.put(key, data);
  }

  static String loadString(String key){
    String data = box.get(key, defaultValue: '');
    return data;
  }

  static Future<void> removeString(String key) async {
    box.delete(key);
  }

  /// FOR A LIST
  static Future<void> storeData (String key, List data) async {
    await box.put(key, data);
  }

  static List loadData(String key){
    List data = box.get(key, defaultValue: []);
    return data;
  }

  static Future<void> removeData(String key) async {
    await box.delete(key);
  }
}