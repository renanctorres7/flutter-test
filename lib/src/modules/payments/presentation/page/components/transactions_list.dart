import 'package:base_project/src/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  Widget _customListTile(String label, String value) {
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
    );
  }

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

          decoration: BoxDecoration(
            color: AppTheme.of.cardBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),

          child: Wrap(
            direction: Axis.horizontal,
            spacing: context.screenSize.width / 3,
            runSpacing: 16,
            children: [
              _customListTile('Schedule $index', 'Schedule $index'),
              _customListTile('Schedule $index', 'Schedule $index'),
              _customListTile('Schedule $index', 'Schedule $index'),
              _customListTile('Schedule $index', 'Schedule $index'),
              _customListTile('Schedule $index', 'Schedule $index'),
              _customListTile('Schedule $index', 'Schedule $index'),
            ],
          ),
        );
      },
    );
  }
}
