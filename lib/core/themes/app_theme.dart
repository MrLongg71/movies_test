import 'package:flutter/material.dart';
import 'package:movies_test/core/themes/typography.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBackground,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: Header3(
        color: AppColors.whiteColor,
      ),
    ),
    primarySwatch: Colors.amber,
    fontFamily: 'Inter',
  );
}
