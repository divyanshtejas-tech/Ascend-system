import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/firebase_options.dart';
import 'config/router.dart';
import 'config/theme.dart';
import 'core/di/injection_container.dart';

future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Initialize Hive for local storage
  await Hive.initFlutter();

  /// Initialize dependency injection
  setupInjection();

  runApp(
    const ProviderScope(
      child: AscendSystemApp(),
    ),
  );
}

/// Root widget for ASCEND SYSTEM
class AscendSystemApp extends StatelessWidget {
  const AscendSystemApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ASCEND SYSTEM',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}
