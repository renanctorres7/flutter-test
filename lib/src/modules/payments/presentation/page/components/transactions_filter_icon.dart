import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/domain.dart';
import '../../bloc/bloc.dart';

class TransactionsFilterIcon extends StatefulWidget {
  final bool isEnable;
  const TransactionsFilterIcon({super.key, required this.isEnable});

  @override
  State<TransactionsFilterIcon> createState() => _TransactionsFilterIconState();
}

class _TransactionsFilterIconState extends State<TransactionsFilterIcon> {
  _getDefaultList(List<PaymentsTransactionFilterEntity> list) {
    return list
        .where((element) => element.isDefault)
        .map((e) => e.label)
        .toList();
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
          final Map<String, bool> filterMap = {};
          final list = state.transactionFilter;
          final selectedList = state.selectedTransactionFilterLabels;
          for (var item in list) {
            filterMap.putIfAbsent(item.label, () => item.isDefault);
          }
          for (var item in selectedList) {
            filterMap.update(item, (value) => true);
          }
          return SizedBox(
            width: 40,
            height: 41,
            child: GestureDetector(
              onTap:
                  widget.isEnable
                      ? () {
                        _showFilterBottomSheet(
                          context: context,
                          filterMap: filterMap,
                          defaultList: _getDefaultList(state.transactionFilter),
                          onFilterChanged: (map) {
                            List<String> selectedList = [];
                            for (var key in map.keys) {
                              if (map[key] == true) {
                                selectedList.add(key);
                              }
                            }
                            context.read<PaymentsBloc>().add(
                              UpdateSelectedTransactionFilterLabels(
                                selectedList,
                              ),
                            );
                          },
                        );
                      }
                      : null,
              child: Icon(
                Icons.more_vert_rounded,
                color:
                    widget.isEnable
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
