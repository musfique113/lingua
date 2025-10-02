import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color lightBackground = Color(0xFFF5F3E8);
  static const Color lightForeground = Color(0xFF0F172A);
  static const Color lightBorder = Color(0xFFE6DFD0);
  static const Color lightInput = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF0066FF);
  static const Color lightPrimaryForeground = Color(0xFFFFFFFF);
  static const Color lightSecondary = Color(0xFFE8F4F9);
  static const Color lightSecondaryForeground = Color(0xFF064E3B);
  static const Color lightMuted = Color(0xFFEEF2F4);
  static const Color lightMutedForeground = Color(0xFF6B7280);
  static const Color lightAccent = Color(0xFF7DC4E4);
  static const Color lightAccentForeground = Color(0xFFFFFFFF);
  static const Color lightDestructive = Color(0xFFEF4444);
  static const Color lightDestructiveForeground = Color(0xFFFFFFFF);
  static const Color lightWarning = Color(0xFFF59E0B);
  static const Color lightWarningForeground = Color(0xFF0F172A);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightCardForeground = Color(0xFF0F172A);
  static const Color lightSidebar = Color(0xFFEBE9DE);
  static const Color lightSidebarForeground = Color(0xFF0F172A);
  static const Color lightSidebarPrimary = Color(0xFFD6EEFA);
  static const Color lightSidebarPrimaryForeground = Color(0xFF0066FF);

  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkForeground = Color(0xFFF5F3E8);
  static const Color darkBorder = Color(0xFF1E293B);
  static const Color darkInput = Color(0xFF1E293B);
  static const Color darkPrimary = Color(0xFF0066FF);
  static const Color darkPrimaryForeground = Color(0xFFFFFFFF);
  static const Color darkSecondary = Color(0xFF1A3A4A);
  static const Color darkSecondaryForeground = Color(0xFFE8F4F9);
  static const Color darkMuted = Color(0xFF1E293B);
  static const Color darkMutedForeground = Color(0xFF94A3B8);
  static const Color darkAccent = Color(0xFF7DC4E4);
  static const Color darkAccentForeground = Color(0xFF0F172A);
  static const Color darkDestructive = Color(0xFFEF4444);
  static const Color darkDestructiveForeground = Color(0xFFFFFFFF);
  static const Color darkWarning = Color(0xFFFBBF24);
  static const Color darkWarningForeground = Color(0xFF0F172A);
  static const Color darkCard = Color(0xFF1E293B);
  static const Color darkCardForeground = Color(0xFFF5F3E8);
  static const Color darkSidebar = Color(0xFF1E293B);
  static const Color darkSidebarForeground = Color(0xFFF5F3E8);
  static const Color darkSidebarPrimary = Color(0xFF003D99);
  static const Color darkSidebarPrimaryForeground = Color(0xFF7DC4E4);
}

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        onSecondary: AppColors.lightSecondaryForeground,
        error: AppColors.lightDestructive,
        surface: AppColors.lightBackground,
        onSurface: AppColors.lightForeground,
        outline: AppColors.lightBorder,
        tertiary: AppColors.lightAccent,
        onTertiary: AppColors.lightAccentForeground,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.lightBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightInput,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.lightDestructive),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: AppColors.lightPrimaryForeground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightForeground,
          side: const BorderSide(color: AppColors.lightBorder),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: 1,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightForeground,
        elevation: 0,
        centerTitle: false,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.lightSidebar,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.lightPrimary,
        contentTextStyle: const TextStyle(
          color: AppColors.lightPrimaryForeground,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkPrimaryForeground,
        secondary: AppColors.darkSecondary,
        onSecondary: AppColors.darkSecondaryForeground,
        error: AppColors.darkDestructive,
        onError: AppColors.darkDestructiveForeground,
        surface: AppColors.darkBackground,
        onSurface: AppColors.darkForeground,
        outline: AppColors.darkBorder,
        tertiary: AppColors.darkAccent,
        onTertiary: AppColors.darkAccentForeground,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.darkBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInput,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.darkDestructive),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: AppColors.darkPrimaryForeground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkForeground,
          side: const BorderSide(color: AppColors.darkBorder),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkForeground,
        elevation: 0,
        centerTitle: false,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.darkSidebar,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkPrimary,
        contentTextStyle: const TextStyle(
          color: AppColors.darkPrimaryForeground,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
