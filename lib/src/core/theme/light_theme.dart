import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme implements AppTheme {
  @override
  Color get backgroundColor => Color(0xFFF4F5F6);

  @override
  Color get cardBackgroundColor => Color(0xFFFFFFFF);

  @override
  Color get checkBoxDefaultColor => Color(0xFF868C98).withValues(alpha: .75);

  @override
  Color get checkBoxSelectedColor => Color(0xFF54B73B);

  @override
  Color get dotIconColor => Color(0xFF37404E);

  @override
  Color get headerColor => Color(0xFF232F69);

  @override
  Color get tabHighlightColor => Color(0xFF54B73B);

  @override
  Color get textCardTitleColor => Color(0xFF5E646E);

  @override
  Color get textColor => Color(0xFF37404E);

  @override
  Color get textDescriptionColor => Color(0xFF868C98).withValues(alpha: .75);

  @override
  Color get textDisabledLinkColor => Color(0xFF868C98).withValues(alpha: .75);

  @override
  Color get textLinkColor => Color(0xFF2C681D);

  @override
  Color get textTabColor => Color(0xFF37404E);

  @override
  Color get textWhiteColor => Colors.white;

  @override
  Color get dividerColor => Color(0xFFDEE0E3);

  @override
  Color get shimmerGrayColor => Color(0xFFF3F3F3);

  @override
  SystemUiOverlayStyle get appSystemUiOverlayStyle => SystemUiOverlayStyle(
    statusBarColor: headerColor,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
