import 'package:alopr/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme {
  light("light"),
  dark("dark");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.light: ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    brightness: Brightness.light,
    textTheme: GoogleFonts.ibmPlexSansTextTheme().copyWith(
      titleLarge: const TextStyle(color: AppColors.headingLight),
      titleMedium: const TextStyle(color: AppColors.headingLight),
      titleSmall: const TextStyle(color: AppColors.headingLight),
      bodyMedium: const TextStyle(color: AppColors.headingLight),
      bodySmall: const TextStyle(color: AppColors.headingLight),
    ),
  ),
  AppTheme.dark: ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.ibmPlexSansTextTheme().copyWith(
      titleLarge: const TextStyle(color: AppColors.headingDark),
      titleMedium: const TextStyle(color: AppColors.headingDark),
      titleSmall: const TextStyle(color: AppColors.headingDark),
      bodyMedium: const TextStyle(color: AppColors.headingDark),
      bodySmall: const TextStyle(color: AppColors.headingDark),
    ),
  ),
};
