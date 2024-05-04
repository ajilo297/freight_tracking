/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class AppTheme {
  ThemeData get theme => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ).copyWith(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
      );
}
