import 'package:base_project/src/core/widgets/app_text/app_amount_text.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AppListTileWithAmount extends StatelessWidget {
  final String label;
  final double value;
  final double? width;
  const AppListTileWithAmount({
    super.key,
    required this.label,
    required this.value,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 2,
        children: [
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,

              color: AppTheme.of.textCardTitleColor,
            ),
          ),
          AppAmountText(value: value),
        ],
      ),
    );
  }
}
