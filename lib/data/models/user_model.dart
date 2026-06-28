import 'package:cloud_firestore/cloud_firestore.dart';

/// User model representing a player in the ASCEND SYSTEM
class UserModel {
  final String uid;
  final String email;
  final String name;
  final int age;
  final double height; // in cm
  final double weight; // in kg
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

  UserModel({
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

  /// Convert to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'bodyFat': bodyFat,
      'fitnessGoal': fitnessGoal,
      'studyGoal': studyGoal,
      'wakeTime': wakeTime,
      'sleepTime': sleepTime,
      'isVegetarian': isVegetarian,
      'medicalLimitations': medicalLimitations,
      'level': level,
      'currentXp': currentXp,
      'totalXp': totalXp,
      'gold': gold,
      'streak': streak,
      'rank': rank,
      'energy': energy,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  /// Create from Firestore document
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      gender: json['gender'] as String,
      bodyFat: json['bodyFat'] != null ? (json['bodyFat'] as num).toDouble() : null,
      fitnessGoal: json['fitnessGoal'] as String,
      studyGoal: json['studyGoal'] as String,
      wakeTime: json['wakeTime'] as String,
      sleepTime: json['sleepTime'] as String,
      isVegetarian: json['isVegetarian'] as bool,
      medicalLimitations: json['medicalLimitations'] as String?,
      level: json['level'] as int,
      currentXp: json['currentXp'] as int,
      totalXp: json['totalXp'] as int,
      gold: json['gold'] as int,
      streak: json['streak'] as int,
      rank: json['rank'] as String,
      energy: json['energy'] as int,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  /// Create a copy with modifications
  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    int? age,
    double? height,
    double? weight,
    String? gender,
    double? bodyFat,
    String? fitnessGoal,
    String? studyGoal,
    String? wakeTime,
    String? sleepTime,
    bool? isVegetarian,
    String? medicalLimitations,
    int? level,
    int? currentXp,
    int? totalXp,
    int? gold,
    int? streak,
    String? rank,
    int? energy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      bodyFat: bodyFat ?? this.bodyFat,
      fitnessGoal: fitnessGoal ?? this.fitnessGoal,
      studyGoal: studyGoal ?? this.studyGoal,
      wakeTime: wakeTime ?? this.wakeTime,
      sleepTime: sleepTime ?? this.sleepTime,
      isVegetarian: isVegetarian ?? this.isVegetarian,
      medicalLimitations: medicalLimitations ?? this.medicalLimitations,
      level: level ?? this.level,
      currentXp: currentXp ?? this.currentXp,
      totalXp: totalXp ?? this.totalXp,
      gold: gold ?? this.gold,
      streak: streak ?? this.streak,
      rank: rank ?? this.rank,
      energy: energy ?? this.energy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
