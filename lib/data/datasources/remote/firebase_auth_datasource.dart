import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';

/// Firebase Authentication Datasource
class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  /// Stream of auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Sign up with email and password
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);

      return UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: name,
        age: 0,
        height: 0,
        weight: 0,
        gender: '',
        fitnessGoal: '',
        studyGoal: '',
        wakeTime: '',
        sleepTime: '',
        isVegetarian: false,
        level: 1,
        currentXp: 0,
        totalXp: 0,
        gold: 0,
        streak: 0,
        rank: 'F',
        energy: 100,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Sign up failed',
      );
    }
  }

  /// Sign in with email and password
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: userCredential.user!.displayName ?? '',
        age: 0,
        height: 0,
        weight: 0,
        gender: '',
        fitnessGoal: '',
        studyGoal: '',
        wakeTime: '',
        sleepTime: '',
        isVegetarian: false,
        level: 1,
        currentXp: 0,
        totalXp: 0,
        gold: 0,
        streak: 0,
        rank: 'F',
        energy: 100,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Sign in failed',
      );
    }
  }

  /// Sign in with Google
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) throw Exception('Google sign in cancelled');

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      return UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        name: userCredential.user!.displayName ?? '',
        age: 0,
        height: 0,
        weight: 0,
        gender: '',
        fitnessGoal: '',
        studyGoal: '',
        wakeTime: '',
        sleepTime: '',
        isVegetarian: false,
        level: 1,
        currentXp: 0,
        totalXp: 0,
        gold: 0,
        streak: 0,
        rank: 'F',
        energy: 100,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Google sign in failed',
      );
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Failed to send reset email',
      );
    }
  }
}
