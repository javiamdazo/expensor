import 'package:flutter/material.dart';

class AppThemeData {
  static late Color textColorByBrightness;
  static late Color selectedPrimaryColor;
  static late TextTheme appTextTheme;

  static void initialize(
      {required Color textColor,
      required Color primaryColor,
      required TextTheme textTheme}) {
    textColorByBrightness = textColor;
    selectedPrimaryColor = primaryColor;
    appTextTheme = textTheme;
  }
}
