import 'package:cloud_firestore/cloud_firestore.dart';

/// Workout model for exercise tracking
class WorkoutModel {
  final String id;
  final String userId;
  final String name;
  final String goal; // weight_loss, muscle_gain, athletic, etc
  final int daysPerWeek;
  final String equipment; // gym, home, both
  final String difficulty; // beginner, intermediate, advanced, expert
  final List<ExerciseModel> exercises;
  final int totalDuration; // in minutes
  final int caloriesBurned;
  final DateTime date;
  final bool isCompleted;

  WorkoutModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.goal,
    required this.daysPerWeek,
    required this.equipment,
    required this.difficulty,
    required this.exercises,
    required this.totalDuration,
    required this.caloriesBurned,
    required this.date,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'goal': goal,
      'daysPerWeek': daysPerWeek,
      'equipment': equipment,
      'difficulty': difficulty,
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'totalDuration': totalDuration,
      'caloriesBurned': caloriesBurned,
      'date': Timestamp.fromDate(date),
      'isCompleted': isCompleted,
    };
  }

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      goal: json['goal'] as String,
      daysPerWeek: json['daysPerWeek'] as int,
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as String,
      exercises: (json['exercises'] as List).map((e) => ExerciseModel.fromJson(e as Map<String, dynamic>)).toList(),
      totalDuration: json['totalDuration'] as int,
      caloriesBurned: json['caloriesBurned'] as int,
      date: (json['date'] as Timestamp).toDate(),
      isCompleted: json['isCompleted'] as bool,
    );
  }
}

/// Exercise model for individual exercises
class ExerciseModel {
  final String id;
  final String name;
  final String muscleGroup;
  final int sets;
  final int reps;
  final int restSeconds;
  final String instructions;
  final String? videoUrl;
  final String? imageUrl;
  final bool isCompleted;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.sets,
    required this.reps,
    required this.restSeconds,
    required this.instructions,
    this.videoUrl,
    this.imageUrl,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'muscleGroup': muscleGroup,
      'sets': sets,
      'reps': reps,
      'restSeconds': restSeconds,
      'instructions': instructions,
      'videoUrl': videoUrl,
      'imageUrl': imageUrl,
      'isCompleted': isCompleted,
    };
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      muscleGroup: json['muscleGroup'] as String,
      sets: json['sets'] as int,
      reps: json['reps'] as int,
      restSeconds: json['restSeconds'] as int,
      instructions: json['instructions'] as String,
      videoUrl: json['videoUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isCompleted: json['isCompleted'] as bool,
    );
  }
}
