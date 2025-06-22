import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pudge/core/theme/colors.dart';

abstract class AppTypography {
  static final TextStyle _baseStyle = GoogleFonts.nunito();
  static final TextTheme _baseTextTheme = GoogleFonts.nunitoTextTheme();

  static final TextStyle displayLarge = _baseStyle.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.onBackground,
  );

  static final TextStyle bodySmallLight = _baseStyle.copyWith(
    fontSize: 14,
    color: AppColors.onBackground.withAlpha(100),
    fontWeight: FontWeight.w300, // Light
  );

  static final TextStyle inputHint = _baseStyle.copyWith(
    fontSize: 16,
    color: AppColors.textHint,
    fontWeight: FontWeight.w400, // Regular
  );

  static final TextStyle buttonLabel = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.onPrimary,
  );

  static final TextStyle bodyLarge = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.onBackground,

  );

  static final TextStyle bodyRegular = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.onBackground,
  );

  static final TextStyle bodySmall = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300, // Regular
    color: AppColors.onBackground,
  );

  static final TextStyle titleLarge = _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColors.onBackground,
  );

  static final TextStyle titleMedium = _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.onBackground,
  );

  static TextTheme buildTextTheme() {
    return _baseTextTheme.copyWith(
      displayLarge: displayLarge,
      // headlineMedium: AppTextStyles.headlineMedium, // если есть
      bodySmall: bodySmallLight,
      labelLarge: buttonLabel,
      bodyMedium: bodyRegular,
      titleMedium: titleMedium,
    );
  }
}
