import 'package:base_project/src/core/localization/language.dart';
import 'package:base_project/src/modules/payments/presentation/page/components/schedule_list.dart';
import 'package:base_project/src/modules/payments/presentation/page/components/transactions_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/widgets.dart';
import 'components/make_payment_button.dart';
import 'components/summary_list.dart';

class PaymentsTransactionsPage extends StatefulWidget {
  const PaymentsTransactionsPage({super.key});

  @override
  State<PaymentsTransactionsPage> createState() =>
      _PaymentsTransactionsPageState();
}

class _PaymentsTransactionsPageState extends State<PaymentsTransactionsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final int _tabLength = 2;

  bool _showSchedule = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _tabLength, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseDefaultBackground(
      appBar: appBarDefault(
        Language.of.payments,
        questionButtonOnPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            spacing: 24,
            children: [
              SummaryList(),
              MakePaymentButton(),
              ScheduleTransactionsTabBar(
                tabController: tabController,
                onTap: (index) {
                  setState(() {
                    _showSchedule = index == 0;
                  });
                },
              ),
              AnimatedCrossFade(
                firstChild: ScheduleList(),
                secondChild: TransactionsList(),
                crossFadeState:
                    _showSchedule
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
