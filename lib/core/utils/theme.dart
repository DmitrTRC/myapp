import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF007BFF); // Custom primary color
  static const Color error = Color(0xFFDC3545); // Custom error color
  static const Color background = Color(0xFFF8F9FA);
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );
    static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    color: AppColors.textPrimary,
  );
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
        primarySwatch: MaterialColor(
        AppColors.primary.value,
        <int, Color>{
          50: AppColors.primary.withOpacity(0.1),
          100: AppColors.primary.withOpacity(0.2),
          200: AppColors.primary.withOpacity(0.3),
        }),
      scaffoldBackgroundColor: AppColors.background,
      
      colorScheme: ColorScheme.fromSeed(seedColor:AppColors.primary, error:AppColors.error),
      textTheme: const TextTheme(
          titleLarge: AppTextStyles.title,
      titleMedium: AppTextStyles.subtitle,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.bodySmall,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    ),
  );
}