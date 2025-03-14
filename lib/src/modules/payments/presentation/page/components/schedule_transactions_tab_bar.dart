import 'package:base_project/src/core/core.dart';
import 'package:base_project/src/core/localization/language.dart';
import 'package:base_project/src/modules/payments/presentation/page/components/transactions_filter_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';

class ScheduleTransactionsTabBar extends StatefulWidget {
  final TabController tabController;
  final Function(int) onTap;

  const ScheduleTransactionsTabBar({
    super.key,
    required this.tabController,
    required this.onTap,
  });

  @override
  State<ScheduleTransactionsTabBar> createState() =>
      _ScheduleTransactionsTabBarState();
}

class _ScheduleTransactionsTabBarState
    extends State<ScheduleTransactionsTabBar> {
  bool _isMoreEnabled = false;

  _setIsMoreEnabled(int index) {
    setState(() {
      _isMoreEnabled = index == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: context.screenSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TabBar(
              controller: widget.tabController,
              onTap: (value) {
                widget.onTap(value);
                _setIsMoreEnabled(value);
              },
              labelColor: AppTheme.of.textColor,
              unselectedLabelColor: AppTheme.of.textCardTitleColor,
              indicatorColor: AppTheme.of.tabHighlightColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: Language.of.schedule.toUpperCase()),
                Tab(text: Language.of.transactions.toUpperCase()),
              ],
            ),
          ),
          TransactionsFilterIcon(isEnable: _isMoreEnabled),
        ],
      ),
    );
  }
}
