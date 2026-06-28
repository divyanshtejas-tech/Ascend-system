// ASCEND SYSTEM - Core Dependency Injection
// This file initializes all dependencies for the app

import 'package:get_it/get_it.dart';
import '../../data/datasources/remote/firebase_auth_datasource.dart';
import '../../data/datasources/remote/firebase_firestore_datasource.dart';
import '../../data/datasources/local/hive_datasource.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/repositories/workout_repository.dart';
import '../../data/repositories/quest_repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Datasources
  getIt.registerSingleton<FirebaseAuthDataSource>(
    FirebaseAuthDataSource(),
  );
  getIt.registerSingleton<FirebaseFirestoreDataSource>(
    FirebaseFirestoreDataSource(),
  );
  getIt.registerSingleton<HiveDataSource>(
    HiveDataSource(),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(getIt<FirebaseAuthDataSource>()),
  );
  getIt.registerSingleton<UserRepository>(
    UserRepository(getIt<FirebaseFirestoreDataSource>()),
  );
  getIt.registerSingleton<WorkoutRepository>(
    WorkoutRepository(getIt<FirebaseFirestoreDataSource>()),
  );
  getIt.registerSingleton<QuestRepository>(
    QuestRepository(getIt<FirebaseFirestoreDataSource>()),
  );
}
