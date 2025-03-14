import 'package:flutter/material.dart';

import '../../core.dart';
import '../../theme/app_theme.dart';

class AppAmountText extends StatelessWidget {
  final double value;
  const AppAmountText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            "\$",

            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppTheme.of.textColor,
            ),
          ),
        ),
        Text(
          ConverterHelper.doubleToReal(value),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppTheme.of.textColor,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
