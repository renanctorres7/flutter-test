import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
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
            children: [
              Expanded(child: Text('Schedule $index')),
              Expanded(child: Text('Schedule $index')),
            ],
          ),
        );
      },
    );
  }
}
