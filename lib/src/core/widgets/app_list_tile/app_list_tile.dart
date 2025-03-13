import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AppListTile extends StatelessWidget {
  final String label;
  final String value;
  final double? width;
  const AppListTile({
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
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.of.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
