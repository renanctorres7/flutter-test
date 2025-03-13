import 'package:base_project/src/core/localization/language.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class ScheduleTransactionsTabBar extends StatefulWidget {
  final TabController tabController;
  final Function(int) onTap;
  final Function()? onMorePressed;
  const ScheduleTransactionsTabBar({
    super.key,
    required this.tabController,
    required this.onTap,
    this.onMorePressed,
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
      width: MediaQuery.of(context).size.width,
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
          SizedBox(
            width: 40,
            height: 41,
            child: GestureDetector(
              onTap: _isMoreEnabled ? widget.onMorePressed : null,
              child: Icon(
                Icons.more_vert_rounded,
                color:
                    _isMoreEnabled
                        ? AppTheme.of.textColor
                        : AppTheme.of.textDisabledLinkColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
