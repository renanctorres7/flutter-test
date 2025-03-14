import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../theme/app_theme.dart';

class ScheduleListShimmer extends StatelessWidget {
  const ScheduleListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          height: 56,
          decoration: BoxDecoration(
            color: AppTheme.of.cardBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),

          child: Flex(
            direction: Axis.horizontal,
            spacing: 16,
            children: [
              Expanded(
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
              Expanded(
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
          ),
        );
      },
    );
  }
}
