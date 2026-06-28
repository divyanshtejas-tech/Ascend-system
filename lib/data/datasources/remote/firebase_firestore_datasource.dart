import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_model.dart';
import '../../models/quest_model.dart';
import '../../models/workout_model.dart';
import '../../models/achievement_model.dart';

/// Firebase Firestore Datasource
class FirebaseFirestoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get user by UID
  Future<UserModel> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) throw Exception('User not found');
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  /// Create or update user
  Future<void> setUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } catch (e) {
      throw Exception('Failed to set user: $e');
    }
  }

  /// Update user XP and level
  Future<void> updateUserXp(String uid, int xpGain) async {
    try {
      final userDoc = _firestore.collection('users').doc(uid);
      final user = await getUser(uid);
      
      int newXp = user.currentXp + xpGain;
      int newLevel = user.level;
      int newTotalXp = user.totalXp + xpGain;
      String newRank = user.rank;

      await userDoc.update({
        'currentXp': newXp,
        'totalXp': newTotalXp,
        'level': newLevel,
        'rank': newRank,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to update XP: $e');
    }
  }

  /// Add gold to user
  Future<void> addGold(String uid, int amount) async {
    try {
      final userDoc = _firestore.collection('users').doc(uid);
      await userDoc.update({
        'gold': FieldValue.increment(amount),
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to add gold: $e');
    }
  }

  /// Get all quests for a user
  Future<List<QuestModel>> getUserQuests(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('quests')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs
          .map((doc) => QuestModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get quests: $e');
    }
  }

  /// Create or update quest
  Future<void> setQuest(QuestModel quest) async {
    try {
      await _firestore.collection('quests').doc(quest.id).set(quest.toJson());
    } catch (e) {
      throw Exception('Failed to set quest: $e');
    }
  }

  /// Complete a quest
  Future<void> completeQuest(String questId, String userId) async {
    try {
      await _firestore.collection('quests').doc(questId).update({
        'isCompleted': true,
        'completedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to complete quest: $e');
    }
  }

  /// Get all workouts for a user
  Future<List<WorkoutModel>> getUserWorkouts(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('workouts')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs
          .map((doc) => WorkoutModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get workouts: $e');
    }
  }

  /// Create or update workout
  Future<void> setWorkout(WorkoutModel workout) async {
    try {
      await _firestore.collection('workouts').doc(workout.id).set(workout.toJson());
    } catch (e) {
      throw Exception('Failed to set workout: $e');
    }
  }

  /// Get achievements for a user
  Future<List<AchievementModel>> getUserAchievements(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('achievements')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs
          .map((doc) => AchievementModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get achievements: $e');
    }
  }

  /// Unlock achievement
  Future<void> unlockAchievement(String achievementId) async {
    try {
      await _firestore.collection('achievements').doc(achievementId).update({
        'isUnlocked': true,
        'unlockedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to unlock achievement: $e');
    }
  }
}
