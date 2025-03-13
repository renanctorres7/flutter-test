import 'package:base_project/src/core/core.dart';
import 'package:base_project/src/core/widgets/app_list_tile/app_list_tile.dart';
import 'package:base_project/src/core/widgets/app_list_tile/app_list_tile_with_amount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/language.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../bloc/bloc.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({super.key});

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  bool _isItemEnabled(List<String> filterList, String label) {
    bool isEnabled = false;
    for (var item in filterList) {
      if (item == label) {
        isEnabled = true;
        break;
      }
    }
    return isEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsBloc, PaymentsState>(
      builder: (_, state) {
        if (state is PaymentsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PaymentsError) {
          return Center(child: appTextDefault("Erro: ${state.message}"));
        }

        if (state is PaymentsLoaded) {
          final transactions = state.transactions;

          if (transactions.isEmpty) {
            return Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.center,
              child: appTextDefault(
                Language.of.transactionsEmptyDescription,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: AppTheme.of.textDescriptionColor,
              ),
            );
          }
          return ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
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
                        if (_isItemEnabled(
                          state.selectedTransactionFilterLabels,
                          Language.of.principal,
                        ))
                          AppListTileWithAmount(
                            width: itemWidth,
                            label: Language.of.principal,
                            value: transaction.actualPrincipalPaymentAmount,
                          ),

                        if (_isItemEnabled(
                          state.selectedTransactionFilterLabels,
                          Language.of.interest,
                        ))
                          AppListTileWithAmount(
                            width: itemWidth,
                            label: Language.of.interest,
                            value: transaction.actualInterestPaymentAmount,
                          ),

                        if (_isItemEnabled(
                          state.selectedTransactionFilterLabels,
                          Language.of.lateFee,
                        ))
                          AppListTileWithAmount(
                            width: itemWidth,
                            label: Language.of.lateFee,
                            value: transaction.actualFee,
                          ),

                        if (_isItemEnabled(
                          state.selectedTransactionFilterLabels,
                          Language.of.postDate,
                        ))
                          AppListTile(
                            width: itemWidth,
                            label: Language.of.postDate,
                            value: ConverterHelper.stringNullableToMMDDYYYY(
                              transaction.actualPaymentPostDate
                                  .toIso8601String(),
                            ),
                          ),

                        if (_isItemEnabled(
                          state.selectedTransactionFilterLabels,
                          Language.of.principalBalance,
                        ))
                          AppListTileWithAmount(
                            width: itemWidth,
                            label: Language.of.principalBalance,
                            value: transaction.outstandingPrincipalBalance,
                          ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
