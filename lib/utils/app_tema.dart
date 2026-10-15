import 'package: flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFF2347A8);
  static const primaryDark = Color(0xFF16307A);
  static const accent = Color(0xFFFFC928);
  static const success = Color(0xFF2EAD6B);
  static const error = Color(0xFFE5484D);
  static const background = Color(0xFFF4F6FC);
  static const surface = Colors.white;
  static const border = Color(0xFFDCE2F2);
  static const textDark = Color(0xFF1B2440);
  static const textMuted = Color(0xFF6B7491);

  extension ColorOpacityX on Color {
  Color o(double opacity) =>
      withAlpha((opacity.clamp(0.0, 1.0) * 255).round());
}

class AppTheme {
  AppTheme._();

  static const fontFamily = 'Poppins';

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      fontFamily: FontFamily,
      scaffoldBackgroundColor: AppColors.background;
    );
  }
}
