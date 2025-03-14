import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../widgets.dart';

class AppMessageInfo extends StatelessWidget {
  final String message;
  const AppMessageInfo({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: const EdgeInsets.only(left: 32, right: 32),
      alignment: Alignment.center,
      child: appTextDefault(
        message,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: AppTheme.of.textDescriptionColor,
        textAlign: TextAlign.center,
      ),
    );
  }
}
