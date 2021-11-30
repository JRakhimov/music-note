import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF000000);
  static const secondary = Color(0xFF7AA6ED);
  static const background = Color(0xFFffffff);

  static const _primaryInt = 0xFF000000;
  static const primarySwatch = MaterialColor(
    _primaryInt,
    {
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
