import 'package:flutter/material.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';

class AppTheme {
  // LightTheme
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,

    // CustomFont From Assets
    fontFamily: 'Satoshi',

    // ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );

  // DarkTheme
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,

    // CustomFont From Assets
    fontFamily: 'Satoshi',

    // ElevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}
