import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../widgets.dart';

PreferredSizeWidget appBarDefault(
  String title, {
  Function()? questionButtonOnPressed,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppTheme.of.headerColor,
    centerTitle: true,
    toolbarHeight: 64,
    title: appTextDefault(
      title,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppTheme.of.textWhiteColor,
    ),
    actions: [
      if (questionButtonOnPressed != null)
        IconButton(
          style: IconButton.styleFrom(padding: EdgeInsets.zero),
          icon: Container(
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.of.textWhiteColor, width: 2),
            ),
            child: Icon(
              Icons.question_mark_rounded,
              color: AppTheme.of.textWhiteColor,
              size: 20,
            ),
          ),
          onPressed: questionButtonOnPressed,
        ),
    ],
  );
}
