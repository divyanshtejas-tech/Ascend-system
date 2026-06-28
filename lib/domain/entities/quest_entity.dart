/// Quest entity for domain layer
class Quest {
  final String id;
  final String userId;
  final String type;
  final String title;
  final String description;
  final int xpReward;
  final int goldReward;
  final String difficulty;
  final bool isCompleted;
  final bool isEnabled;
  final bool repeatsDaily;
  final DateTime createdAt;
  final DateTime completedAt;
  final DateTime resetAt;

  Quest({
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
}
