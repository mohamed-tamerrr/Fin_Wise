import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

abstract class AppTheme {
  static ThemeData light(BuildContext context) {
    final colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      background: AppColors.backgroundColor,
      surface: Colors.white,
      onSurface: AppColors.textColor,
      error: Colors.red.shade700,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.lettersandIcons),
        titleTextStyle: AppStyles.semiBold20,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textTheme: TextTheme(
        headlineSmall: AppStyles.bold20,
        titleLarge: AppStyles.semiBold20,
        bodyLarge: AppStyles.regular15,
        bodyMedium: AppStyles.regular14,
        labelLarge: AppStyles.medium15,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
