import 'package:hive_flutter/hive_flutter.dart';
import '../../models/user_model.dart';

/// Local Hive Datasource for offline storage
class HiveDataSource {
  static const String userBoxName = 'users';
  static const String questBoxName = 'quests';
  static const String settingsBoxName = 'settings';

  /// Save user locally
  Future<void> saveUser(UserModel user) async {
    try {
      final box = await Hive.openBox<Map>(userBoxName);
      await box.put(user.uid, user.toJson());
    } catch (e) {
      throw Exception('Failed to save user locally: $e');
    }
  }

  /// Get user from local storage
  Future<UserModel?> getUser(String uid) async {
    try {
      final box = await Hive.openBox<Map>(userBoxName);
      final data = box.get(uid);
      if (data == null) return null;
      return UserModel.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      throw Exception('Failed to get user from local storage: $e');
    }
  }

  /// Clear all local data
  Future<void> clearAll() async {
    try {
      await Hive.deleteBoxFromDisk(userBoxName);
      await Hive.deleteBoxFromDisk(questBoxName);
      await Hive.deleteBoxFromDisk(settingsBoxName);
    } catch (e) {
      throw Exception('Failed to clear local storage: $e');
    }
  }

  /// Save setting
  Future<void> saveSetting(String key, dynamic value) async {
    try {
      final box = await Hive.openBox<dynamic>(settingsBoxName);
      await box.put(key, value);
    } catch (e) {
      throw Exception('Failed to save setting: $e');
    }
  }

  /// Get setting
  Future<dynamic> getSetting(String key) async {
    try {
      final box = await Hive.openBox<dynamic>(settingsBoxName);
      return box.get(key);
    } catch (e) {
      throw Exception('Failed to get setting: $e');
    }
  }
}
