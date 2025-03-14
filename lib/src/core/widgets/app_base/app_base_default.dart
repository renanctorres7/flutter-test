import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_theme.dart';

class AppBaseDefaultBackground extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const AppBaseDefaultBackground({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.of.appSystemUiOverlayStyle,
      child: Container(
        color: AppTheme.of.backgroundColor,
        child: SafeArea(
          child: Scaffold(
            appBar: appBar,
            backgroundColor: AppTheme.of.backgroundColor,

            body: body,
          ),
        ),
      ),
    );
  }
}
