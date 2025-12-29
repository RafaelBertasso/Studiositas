import 'package:flutter/material.dart';

class AppTheme {
  static const Color deepBlue = Color(0xFF4A6B8A);
  static const Color gold = Color(0xFFD4AF37);
  static const Color ivory = Color(0xFFFDFCF8);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ivory,
      colorScheme: ColorScheme.fromSeed(
        seedColor: deepBlue,
        primary: deepBlue,
        secondary: gold,
        surface: ivory,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: deepBlue,
          fontWeight: FontWeight.bold,
          fontFamily: 'Serif',
        ),
        titleLarge: TextStyle(color: deepBlue, fontWeight: FontWeight.w600),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: deepBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
