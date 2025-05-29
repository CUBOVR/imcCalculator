import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class ButtonStyles {
  static ButtonStyle infinityStyle = ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
  );
}
