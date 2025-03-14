import 'package:base_project/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/language.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/domain.dart';
import '../../bloc/bloc.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsBloc, PaymentsState>(
      builder: (_, state) {
        if (state is PaymentsLoading ||
            state is PaymentsError ||
            state is PaymentsInitial) {
          return TransactionListShimmer();
        }

        if (state is PaymentsLoaded) {
          final transactions = state.transactions;

          if (transactions.isEmpty) {
            return AppMessageInfo(
              message: Language.of.transactionsEmptyDescription,
            );
          }
          return ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth / 2) - 16;
                  return _buildTransactionCard(
                    transaction,
                    state.selectedTransactionFilterLabels,
                    itemWidth,
                  );
                },
              );
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _buildTransactionCard(
    PaymentsTransactionsEntity transaction,
    List<String> filters,
    double itemWidth,
  ) {
    final items = [
      AppListTile(
        width: itemWidth,
        label: Language.of.processDate,
        value: ConverterHelper.stringNullableToMMDDYYYY(
          transaction.processDate.toIso8601String(),
        ),
      ),
      AppListTileWithAmount(
        width: itemWidth,
        label: Language.of.amount,
        value: transaction.actualPaymentAmount,
      ),
      AppListTile(
        width: itemWidth,
        label: Language.of.type,
        value: transaction.paymentType,
      ),
      if (filters.contains(Language.of.principal))
        AppListTileWithAmount(
          width: itemWidth,
          label: Language.of.principal,
          value: transaction.actualPrincipalPaymentAmount,
        ),
      if (filters.contains(Language.of.interest))
        AppListTileWithAmount(
          width: itemWidth,
          label: Language.of.interest,
          value: transaction.actualInterestPaymentAmount,
        ),
      if (filters.contains(Language.of.lateFee))
        AppListTileWithAmount(
          width: itemWidth,
          label: Language.of.lateFee,
          value: transaction.actualFee,
        ),
      if (filters.contains(Language.of.postDate))
        AppListTile(
          width: itemWidth,
          label: Language.of.postDate,
          value: ConverterHelper.stringNullableToMMDDYYYY(
            transaction.actualPaymentPostDate.toIso8601String(),
          ),
        ),
      if (filters.contains(Language.of.principalBalance))
        AppListTileWithAmount(
          width: itemWidth,
          label: Language.of.principalBalance,
          value: transaction.outstandingPrincipalBalance,
        ),
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.of.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(runSpacing: 16, children: items),
    );
  }
}
