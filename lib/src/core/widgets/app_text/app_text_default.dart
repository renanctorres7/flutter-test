import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appTextDefault(
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
