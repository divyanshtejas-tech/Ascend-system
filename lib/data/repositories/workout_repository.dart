import '../datasources/remote/firebase_firestore_datasource.dart';
import '../models/workout_model.dart';

/// Workout Repository for workout operations
class WorkoutRepository {
  final FirebaseFirestoreDataSource _firestoreDataSource;

  WorkoutRepository(this._firestoreDataSource);

  /// Get all workouts for a user
  Future<List<WorkoutModel>> getUserWorkouts(String userId) async {
    return await _firestoreDataSource.getUserWorkouts(userId);
  }

  /// Create or update workout
  Future<void> setWorkout(WorkoutModel workout) async {
    return await _firestoreDataSource.setWorkout(workout);
  }
}
