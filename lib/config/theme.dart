import 'package:flutter/material.dart';

class AppTheme {
  /// Color Palette
  static const Color primaryBlack = Color(0xFF0A0E27);
  static const Color darkGrey = Color(0xFF1A1F3A);
  static const Color electricBlue = Color(0xFF0080FF);
  static const Color neonCyan = Color(0xFF00D9FF);
  static const Color purpleGlow = Color(0xFFBB86FC);
  static const Color accentOrange = Color(0xFFFF6B35);
  static const Color successGreen = Color(0xFF00FF88);
  static const Color warningYellow = Color(0xFFFFD600);
  static const Color errorRed = Color(0xFFFF4081);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryBlack,
      primaryColor: electricBlue,
      colorScheme: const ColorScheme.dark(
        primary: electricBlue,
        secondary: neonCyan,
        tertiary: purpleGlow,
        surface: darkGrey,
        background: primaryBlack,
        error: errorRed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlack,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: neonCyan,
          fontFamily: 'Orbitron',
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: neonCyan,
          fontFamily: 'Orbitron',
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: electricBlue,
          fontFamily: 'Orbitron',
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: purpleGlow,
          fontFamily: 'Orbitron',
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: neonCyan,
          fontFamily: 'SpaceGrotesk',
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: electricBlue,
          fontFamily: 'SpaceGrotesk',
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'SpaceGrotesk',
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.white70,
          fontFamily: 'SpaceGrotesk',
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: neonCyan,
          fontFamily: 'SpaceGrotesk',
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: electricBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'SpaceGrotesk',
          ),
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
          borderSide: const BorderSide(color: darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: neonCyan, width: 2),
        ),
        labelStyle: const TextStyle(color: neonCyan),
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      cardTheme: CardTheme(
        color: darkGrey,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
