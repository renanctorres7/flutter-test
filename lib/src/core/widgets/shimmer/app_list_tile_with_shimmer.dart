import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../theme/app_theme.dart';

class AppListTileWithShimmer extends StatelessWidget {
  final String label;
  const AppListTileWithShimmer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            letterSpacing: 0.1,
            color: AppTheme.of.textCardTitleColor,
          ),
        ),
        Flexible(
          child: Shimmer(
            duration: Duration(seconds: 2),
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: AppTheme.of.shimmerGrayColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
