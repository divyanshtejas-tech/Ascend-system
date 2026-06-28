/// User entity for domain layer
class User {
  final String uid;
  final String email;
  final String name;
  final int age;
  final double height;
  final double weight;
  final String gender;
  final double? bodyFat;
  final String fitnessGoal;
  final String studyGoal;
  final String wakeTime;
  final String sleepTime;
  final bool isVegetarian;
  final String? medicalLimitations;
  final int level;
  final int currentXp;
  final int totalXp;
  final int gold;
  final int streak;
  final String rank;
  final int energy;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    this.bodyFat,
    required this.fitnessGoal,
    required this.studyGoal,
    required this.wakeTime,
    required this.sleepTime,
    required this.isVegetarian,
    this.medicalLimitations,
    required this.level,
    required this.currentXp,
    required this.totalXp,
    required this.gold,
    required this.streak,
    required this.rank,
    required this.energy,
    required this.createdAt,
    required this.updatedAt,
  });
}
