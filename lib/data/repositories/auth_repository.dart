import '../datasources/remote/firebase_auth_datasource.dart';
import '../models/user_model.dart';

/// Auth Repository for authentication operations
class AuthRepository {
  final FirebaseAuthDataSource _firebaseAuthDataSource;

  AuthRepository(this._firebaseAuthDataSource);

  /// Sign up with email and password
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    return await _firebaseAuthDataSource.signUpWithEmail(
      email: email,
      password: password,
      name: name,
    );
  }

  /// Sign in with email and password
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuthDataSource.signInWithEmail(
      email: email,
      password: password,
    );
  }

  /// Sign in with Google
  Future<UserModel> signInWithGoogle() async {
    return await _firebaseAuthDataSource.signInWithGoogle();
  }

  /// Sign out
  Future<void> signOut() async {
    return await _firebaseAuthDataSource.signOut();
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    return await _firebaseAuthDataSource.sendPasswordResetEmail(email);
  }

  /// Get current user
  Future<bool> isUserLoggedIn() async {
    return _firebaseAuthDataSource.currentUser != null;
  }

  /// Get auth state changes stream
  Stream<bool> getAuthStateChanges() {
    return _firebaseAuthDataSource.authStateChanges
        .map((user) => user != null);
  }
}
