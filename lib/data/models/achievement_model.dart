import 'package:cloud_firestore/cloud_firestore.dart';

/// Achievement model
class AchievementModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String icon;
  final String category; // workout, study, streak, xp, level
  final bool isUnlocked;
  final DateTime unlockedAt;
  final int requiredCount;
  final int currentCount;

  AchievementModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    required this.isUnlocked,
    required this.unlockedAt,
    required this.requiredCount,
    required this.currentCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'icon': icon,
      'category': category,
      'isUnlocked': isUnlocked,
      'unlockedAt': Timestamp.fromDate(unlockedAt),
      'requiredCount': requiredCount,
      'currentCount': currentCount,
    };
  }

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      category: json['category'] as String,
      isUnlocked: json['isUnlocked'] as bool,
      unlockedAt: (json['unlockedAt'] as Timestamp).toDate(),
      requiredCount: json['requiredCount'] as int,
      currentCount: json['currentCount'] as int,
    );
  }
}
