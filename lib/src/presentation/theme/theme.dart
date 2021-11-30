import 'package:flutter/material.dart';

import 'colors.dart';

export 'colors.dart';

class AppTheme {
  static const buttonHeight = 64.0;
  static const defaultHeight = 60.0;
  static const radiusCircularMain = Radius.circular(12);
  static const borderRadiusMain = BorderRadius.all(radiusCircularMain);
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: 17);

  static ThemeData get theme => ThemeData(
        fontFamily: "Gilroy",
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.background,
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}
