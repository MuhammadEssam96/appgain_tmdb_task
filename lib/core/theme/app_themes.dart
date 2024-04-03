import 'package:flutter/material.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';

class AppThemes {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    // primaryColor: AppColors.primaryColor, // Dark blue for branding
    colorSchemeSeed: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white, // Light background
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
      backgroundColor: AppColors.primaryColor, // Use primary color for background
      titleTextStyle: TextStyle(color: AppColors.white), // Use accent color for text (white suggested for better contrast)
      shadowColor: Colors.transparent,
      titleSpacing: 1,
      actionsIconTheme: IconThemeData(color: AppColors.white), // Use accent color for icons
      iconTheme: IconThemeData(
        color: AppColors.white, // Use accent color for icons
      ),
    ),
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: AppColors.primaryColor, // Use primary color for primary
    //   onPrimary: AppColors.white, // Use accent color for text on primary
    //   secondary: AppColors.secondaryColor, // Use secondary color for secondary
    //   onSecondary: AppColors.white, // Use accent color for text on secondary
    //   tertiaryContainer: AppColors.tertiaryColor, // Use tertiary color for tertiaryContainer
    //   onTertiaryContainer: AppColors.white, // Use accent color for text on tertiaryContainer
    //   error: AppColors.errorColor, // Use error color for errors
    //   onError: AppColors.white, // Use accent color for text on errors (white suggested for better contrast)
    //   background: Colors.white, // Use white for background (adjust if needed)
    //   onBackground: AppColors.primaryColor, // Use accent color for text on background
    //   surface: Colors.white, // Use white for surface (adjust if needed)
    //   onSurface: AppColors.primaryColor, // Use accent color for text on surface
    // ),
  );
}
