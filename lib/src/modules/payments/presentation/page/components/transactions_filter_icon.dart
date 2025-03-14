import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/domain.dart';
import '../../bloc/bloc.dart';

class TransactionsFilterIcon extends StatelessWidget {
  final bool isEnable;
  const TransactionsFilterIcon({super.key, required this.isEnable});

  List<String> _getDefaultList(List<PaymentsTransactionFilterEntity> list) {
    return list.where((e) => e.isDefault).map((e) => e.label).toList();
  }

  void _showFilterBottomSheet({
    required BuildContext context,
    required Map<String, bool> filterMap,
    required Function(Map<String, bool>) onFilterChanged,
    required List<String> defaultList,
  }) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FilterBottomSheet(
          filterMap: filterMap,
          onFilterChanged: onFilterChanged,
          defaultList: defaultList,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsBloc, PaymentsState>(
      builder: (_, state) {
        if (state is PaymentsLoaded) {
          final filterMap = {
            for (var item in state.transactionFilter)
              item.label: item.isDefault,
          };

          for (var item in state.selectedTransactionFilterLabels) {
            filterMap[item] = true;
          }
          return SizedBox(
            width: 40,
            height: 41,
            child: GestureDetector(
              onTap:
                  isEnable
                      ? () => _showFilterBottomSheet(
                        context: context,
                        filterMap: filterMap,
                        defaultList: _getDefaultList(state.transactionFilter),
                        onFilterChanged: (map) {
                          final selectedList =
                              map.entries
                                  .where((entry) => entry.value)
                                  .map((entry) => entry.key)
                                  .toList();
                          context.read<PaymentsBloc>().add(
                            UpdateSelectedTransactionFilterLabels(selectedList),
                          );
                        },
                      )
                      : null,
              child: Icon(
                Icons.more_vert_rounded,
                color:
                    isEnable
                        ? AppTheme.of.textColor
                        : AppTheme.of.textDisabledLinkColor,
                size: 24,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
