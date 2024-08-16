import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBackground,
    ),
    primarySwatch: Colors.amber,
    fontFamily: 'Inter',
  );
}
