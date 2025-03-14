import 'package:base_project/src/core/localization/language.dart';
import 'package:base_project/src/core/widgets/shimmer/app_list_tile_with_shimmer.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class TransactionListShimmer extends StatelessWidget {
  const TransactionListShimmer({super.key});

  static List<String> labels = [
    Language.of.processDate,
    Language.of.amount,
    Language.of.type,
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,

        decoration: BoxDecoration(
          color: AppTheme.of.cardBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),

        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / 2;
            return Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              runSpacing: 16,
              children: [
                for (var label in labels)
                  Container(
                    width: itemWidth,
                    padding: EdgeInsets.only(right: 16),
                    child: AppListTileWithShimmer(label: label),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
