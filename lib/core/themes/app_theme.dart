import 'package:flutter/material.dart';

import '../style/app_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Heuristica',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.teal,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mainPadding,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorder,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Heuristica',
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.teal,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: AppStyles.mainPadding,
      border: OutlineInputBorder(
        borderRadius: AppStyles.mainBorder,
      ),
    ),
  );
}
