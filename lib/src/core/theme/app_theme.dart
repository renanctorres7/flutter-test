import 'package:base_project/src/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static AppTheme get of => LightTheme();

  Color get headerColor;
  Color get backgroundColor;
  Color get textColor;
  Color get textLinkColor;
  Color get textDisabledLinkColor;

  Color get textWhiteColor;
  Color get textTabColor;
  Color get textDescriptionColor;
  Color get textCardTitleColor;

  Color get tabHighlightColor;
  Color get dotIconColor;

  Color get cardBackgroundColor;

  Color get checkBoxDefaultColor;
  Color get checkBoxSelectedColor;

  SystemUiOverlayStyle get appSystemUiOverlayStyle;
}
