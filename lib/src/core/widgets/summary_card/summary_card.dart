import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:base_project/src/core/utils/converter_helper.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String label;
  final double value;
  const SummaryCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 74,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.of.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
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
            ConverterHelper.doubleToReal(value),
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
