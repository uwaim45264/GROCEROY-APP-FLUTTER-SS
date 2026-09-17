import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

final ThemeData whiteTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryGreen,
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryGreen,
    secondary: AppColors.lightGreen,
    surface: AppColors.white,
    background: AppColors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: AppColors.navyBlue,
    onBackground: AppColors.navyBlue,
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: AppColors.navyBlue,
    displayColor: AppColors.navyBlue,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.navyBlue,
    elevation: 0,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryGreen,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
