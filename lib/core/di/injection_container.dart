import 'package:get_it/get_it.dart';
import '../../data/datasources/remote/firebase_auth_datasource.dart';
import '../../data/datasources/remote/firebase_firestore_datasource.dart';
import '../../data/datasources/local/hive_datasource.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/repositories/workout_repository.dart';
import '../../domain/usecases/auth/login_usecase.dart';
import '../../domain/usecases/auth/register_usecase.dart';

final getIt = GetIt.instance;

void setupInjection() {
  /// Register Data Sources
  getIt.registerSingleton<FirebaseAuthDataSource>(FirebaseAuthDataSource());
  getIt.registerSingleton<FirebaseFirestoreDataSource>(
    FirebaseFirestoreDataSource(),
  );
  getIt.registerSingleton<HiveDataSource>(HiveDataSource());

  /// Register Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(getIt<FirebaseAuthDataSource>()),
  );
  getIt.registerSingleton<UserRepository>(
    UserRepository(getIt<FirebaseFirestoreDataSource>()),
  );
  getIt.registerSingleton<WorkoutRepository>(
    WorkoutRepository(getIt<FirebaseFirestoreDataSource>()),
  );

  /// Register Use Cases
  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(getIt<AuthRepository>()),
  );
  getIt.registerSingleton<RegisterUseCase>(
    RegisterUseCase(getIt<AuthRepository>()),
  );
}
