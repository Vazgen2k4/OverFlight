import 'package:flutter/material.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

sealed class AppTextStyles {
  const AppTextStyles._();
  
  static const subtitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.subtiitle,
    height: 22 / 16,
  );
  
  static const inputTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.title,
    height: 22 / 16,
  );
  
  static const hedlineLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: AppColors.title,
    height: 38 / 28,
  );
  
  
}
