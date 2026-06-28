import '../../data/repositories/auth_repository.dart';
import '../entities/user_entity.dart';

/// Register use case
class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<User> call({
    required String email,
    required String password,
    required String name,
  }) async {
    final userModel = await _authRepository.signUpWithEmail(
      email: email,
      password: password,
      name: name,
    );

    return User(
      uid: userModel.uid,
      email: userModel.email,
      name: userModel.name,
      age: userModel.age,
      height: userModel.height,
      weight: userModel.weight,
      gender: userModel.gender,
      bodyFat: userModel.bodyFat,
      fitnessGoal: userModel.fitnessGoal,
      studyGoal: userModel.studyGoal,
      wakeTime: userModel.wakeTime,
      sleepTime: userModel.sleepTime,
      isVegetarian: userModel.isVegetarian,
      medicalLimitations: userModel.medicalLimitations,
      level: userModel.level,
      currentXp: userModel.currentXp,
      totalXp: userModel.totalXp,
      gold: userModel.gold,
      streak: userModel.streak,
      rank: userModel.rank,
      energy: userModel.energy,
      createdAt: userModel.createdAt,
      updatedAt: userModel.updatedAt,
    );
  }
}
