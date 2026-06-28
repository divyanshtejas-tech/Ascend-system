import '../datasources/remote/firebase_firestore_datasource.dart';
import '../models/user_model.dart';

/// User Repository for user operations
class UserRepository {
  final FirebaseFirestoreDataSource _firestoreDataSource;

  UserRepository(this._firestoreDataSource);

  /// Get user by UID
  Future<UserModel> getUser(String uid) async {
    return await _firestoreDataSource.getUser(uid);
  }

  /// Create or update user
  Future<void> setUser(UserModel user) async {
    return await _firestoreDataSource.setUser(user);
  }

  /// Update user XP
  Future<void> addXp(String uid, int xp) async {
    return await _firestoreDataSource.updateUserXp(uid, xp);
  }

  /// Add gold to user
  Future<void> addGold(String uid, int amount) async {
    return await _firestoreDataSource.addGold(uid, amount);
  }
}
