import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryBlack = Color(0xFF0A0E27);
  static const Color darkGrey = Color(0xFF1A1F3A);
  static const Color mediumGrey = Color(0xFF2D3561);
  static const Color lightGrey = Color(0xFF4A5578);
  
  static const Color neonCyan = Color(0xFF00D9FF);
  static const Color electricBlue = Color(0xFF0066FF);
  static const Color vibrantPurple = Color(0xFF9D00FF);
  static const Color neonGreen = Color(0xFF00FF88);
  static const Color warmOrange = Color(0xFFFF6B00);
  static const Color hotPink = Color(0xFFFF006E);
  
  static const Color successGreen = Color(0xFF00C853);
  static const Color warningOrange = Color(0xFFFF9100);
  static const Color errorRed = Color(0xFFFF3D00);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: electricBlue,
      scaffoldBackgroundColor: primaryBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlack,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: neonCyan,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: electricBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: mediumGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: neonCyan, width: 2),
        ),
        labelStyle: const TextStyle(color: lightGrey),
        hintStyle: const TextStyle(color: mediumGrey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: electricBlue,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: electricBlue,
          side: const BorderSide(color: electricBlue),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: neonCyan,
          letterSpacing: 2,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: electricBlue,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: neonCyan,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: lightGrey,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: neonCyan,
        ),
      ),
    );
  }
}
