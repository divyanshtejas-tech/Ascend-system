import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/auth/register_screen.dart';
import 'presentation/screens/auth/onboarding_screen.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/workout/workout_screen.dart';
import 'presentation/screens/study/study_screen.dart';
import 'presentation/screens/diet/diet_screen.dart';
import 'presentation/screens/achievements/achievements_screen.dart';
import 'presentation/screens/shop/shop_screen.dart';
import 'presentation/screens/profile/profile_screen.dart';
import 'presentation/screens/settings/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase and other dependencies
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'ASCEND SYSTEM',
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/workout': (context) => const WorkoutScreen(),
        '/study': (context) => const StudyScreen(),
        '/diet': (context) => const DietScreen(),
        '/achievements': (context) => const AchievementsScreen(),
        '/shop': (context) => const ShopScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
