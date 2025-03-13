import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appTextDefault(
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      color: color ?? AppTheme.of.textColor,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: fontStyle,
    ),
  );
}
