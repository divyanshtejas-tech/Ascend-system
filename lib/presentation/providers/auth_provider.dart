import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../core/di/injection_container.dart';

/// Auth state notifier
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  AuthNotifier() : super(const AsyncValue.data(null)) {
    _initAuthState();
  }

  void _initAuthState() {
    _authRepository.getAuthStateChanges().listen((isLoggedIn) {
      if (isLoggedIn) {
        // Load user data
      } else {
        state = const AsyncValue.data(null);
      }
    });
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final userModel = await _authRepository.signInWithEmail(
        email: email,
        password: password,
      );
      final user = User(
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
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const AsyncValue.loading();
    try {
      final userModel = await _authRepository.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );
      final user = User(
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
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Auth provider
final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier();
});
