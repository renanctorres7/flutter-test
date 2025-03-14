import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:base_project/src/core/utils/converter_helper.dart';
import 'package:flutter/material.dart';

import '../app_list_tile/app_list_tile_with_amount.dart';
import '../widgets.dart';

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
      child: AppListTileWithAmount(label: label, value: value),
    );
  }
}
