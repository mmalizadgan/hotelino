import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        //ONboarding Screen DisplayText
        displayLarge: TextStyle(
          fontSize: 24,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w400,
        ),

        //ONboarding Screen  HeadlineText
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.lightSelectedBorder,
            width: 1.5,
          ),
        ),
        hintStyle: const TextStyle(color: AppColors.lightHint, fontSize: 14),
        labelStyle: const TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return baseLight.copyWith(
      colorScheme: baseLight.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primaryColor,
        surfaceContainerLow: Colors.grey[200],
      ),
    );
  }

  //Dark Theme
  static ThemeData get darkTheme {
    final basedark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        //ONboarding Screen DisplayText
        displayLarge: TextStyle(
          fontSize: 24,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w400,
        ),

        //ONboarding Screen  HeadlineText
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputFill,
        contentPadding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.darkSelectedBorder,
            width: 1.5,
          ),
        ),
        hintStyle: const TextStyle(color: AppColors.darkHint, fontSize: 14),
        labelStyle: const TextStyle(
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return basedark.copyWith(
      colorScheme: basedark.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primaryColor,
      ),
    );
  }
}
