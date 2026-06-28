import 'package:cloud_firestore/cloud_firestore.dart';

/// Quest model for daily quests and habits
class QuestModel {
  final String id;
  final String userId;
  final String type; // workout, study, water, sleep, meditation, reading, walking, stretching
  final String title;
  final String description;
  final int xpReward;
  final int goldReward;
  final String difficulty; // easy, medium, hard
  final bool isCompleted;
  final bool isEnabled;
  final bool repeatsDaily;
  final DateTime createdAt;
  final DateTime completedAt;
  final DateTime resetAt;

  QuestModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.description,
    required this.xpReward,
    required this.goldReward,
    required this.difficulty,
    required this.isCompleted,
    required this.isEnabled,
    required this.repeatsDaily,
    required this.createdAt,
    required this.completedAt,
    required this.resetAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'title': title,
      'description': description,
      'xpReward': xpReward,
      'goldReward': goldReward,
      'difficulty': difficulty,
      'isCompleted': isCompleted,
      'isEnabled': isEnabled,
      'repeatsDaily': repeatsDaily,
      'createdAt': Timestamp.fromDate(createdAt),
      'completedAt': Timestamp.fromDate(completedAt),
      'resetAt': Timestamp.fromDate(resetAt),
    };
  }

  factory QuestModel.fromJson(Map<String, dynamic> json) {
    return QuestModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      xpReward: json['xpReward'] as int,
      goldReward: json['goldReward'] as int,
      difficulty: json['difficulty'] as String,
      isCompleted: json['isCompleted'] as bool,
      isEnabled: json['isEnabled'] as bool,
      repeatsDaily: json['repeatsDaily'] as bool,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      completedAt: (json['completedAt'] as Timestamp).toDate(),
      resetAt: (json['resetAt'] as Timestamp).toDate(),
    );
  }

  QuestModel copyWith({
    String? id,
    String? userId,
    String? type,
    String? title,
    String? description,
    int? xpReward,
    int? goldReward,
    String? difficulty,
    bool? isCompleted,
    bool? isEnabled,
    bool? repeatsDaily,
    DateTime? createdAt,
    DateTime? completedAt,
    DateTime? resetAt,
  }) {
    return QuestModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      xpReward: xpReward ?? this.xpReward,
      goldReward: goldReward ?? this.goldReward,
      difficulty: difficulty ?? this.difficulty,
      isCompleted: isCompleted ?? this.isCompleted,
      isEnabled: isEnabled ?? this.isEnabled,
      repeatsDaily: repeatsDaily ?? this.repeatsDaily,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      resetAt: resetAt ?? this.resetAt,
    );
  }
}
