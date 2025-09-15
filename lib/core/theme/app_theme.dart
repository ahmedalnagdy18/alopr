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
      titleLarge: GoogleFonts.ibmPlexSans(
          color: AppColors.headingLight, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.ibmPlexSans(color: AppColors.headingLight),
      titleSmall: GoogleFonts.ibmPlexSans(color: AppColors.headingLight),
      bodyMedium: GoogleFonts.ibmPlexSans(color: AppColors.headingLight),
      bodySmall: GoogleFonts.ibmPlexSans(color: AppColors.headingLight),
    ),
  ),
  AppTheme.dark: ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.ibmPlexSansTextTheme().copyWith(
      titleLarge: GoogleFonts.ibmPlexSans(color: AppColors.headingDark),
      titleMedium: GoogleFonts.ibmPlexSans(color: AppColors.headingDark),
      titleSmall: GoogleFonts.ibmPlexSans(color: AppColors.headingDark),
      bodyMedium: GoogleFonts.ibmPlexSans(color: AppColors.headingDark),
      bodySmall: GoogleFonts.ibmPlexSans(color: AppColors.headingDark),
    ),
  ),
};
