import '../datasources/remote/firebase_firestore_datasource.dart';
import '../models/quest_model.dart';

/// Quest Repository for quest operations
class QuestRepository {
  final FirebaseFirestoreDataSource _firestoreDataSource;

  QuestRepository(this._firestoreDataSource);

  /// Get all quests for a user
  Future<List<QuestModel>> getUserQuests(String userId) async {
    return await _firestoreDataSource.getUserQuests(userId);
  }

  /// Create or update quest
  Future<void> setQuest(QuestModel quest) async {
    return await _firestoreDataSource.setQuest(quest);
  }

  /// Complete a quest
  Future<void> completeQuest(String questId, String userId) async {
    return await _firestoreDataSource.completeQuest(questId, userId);
  }
}
