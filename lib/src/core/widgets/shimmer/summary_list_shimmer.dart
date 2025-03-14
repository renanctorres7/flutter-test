import 'package:base_project/src/core/core.dart';
import 'package:base_project/src/core/localization/language.dart';
import 'package:base_project/src/core/widgets/shimmer/app_list_tile_with_shimmer.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class SummaryListShimmer extends StatelessWidget {
  const SummaryListShimmer({super.key});

  static List<String> labels = [
    Language.of.outstandingBalance,
    Language.of.totalPaid,
    Language.of.principalPaid,
    Language.of.interestPaid,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      height: 74,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 16, right: 16),
        itemCount: labels.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: 144,
              height: 74,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.of.cardBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppListTileWithShimmer(label: labels[index]),
            ),
          );
        },
      ),
    );
  }
}

// #E7E5E5
