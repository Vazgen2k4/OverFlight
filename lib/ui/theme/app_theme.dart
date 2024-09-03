import 'package:flutter/material.dart';
import 'package:over_flight/ui/theme/app_colors.dart';
import 'package:over_flight/ui/theme/app_text_styles.dart';

class AppTheme {
  static final light = ThemeData.light(useMaterial3: true).copyWith(
    textTheme: _text,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: AppColors.title,
      ),
    ),
  );

  static final dark =
      ThemeData.dark(useMaterial3: true).copyWith(textTheme: _text);

  static final _text = TextTheme(
    titleLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: AppColors.title,
      height: 38 / 28,
    ),
    titleMedium: AppTextStyles.subtitle,
    headlineLarge: AppTextStyles.hedlineLarge,
    bodyMedium: AppTextStyles.subtitle.copyWith(color: AppColors.title),
  );
}
