import 'package:base_project/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../bloc/bloc.dart';

class SummaryList extends StatefulWidget {
  const SummaryList({super.key});

  @override
  State<SummaryList> createState() => _SummaryListState();
}

class _SummaryListState extends State<SummaryList> {
  _showErrorDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<PaymentsBloc>().state is PaymentsError) {
        showDialog(context: context, builder: (context) => AppDialogError());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsBloc, PaymentsState>(
      builder: (_, state) {
        if (state is PaymentsLoading ||
            state is PaymentsError ||
            state is PaymentsInitial) {
          _showErrorDialog(context);

          return SummaryListShimmer();
        }

        if (state is PaymentsLoaded) {
          if (state.summary.isEmpty) {
            return const SizedBox();
          }
          return SizedBox(
            width: context.screenSize.width,
            height: 74,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16, right: 16),
              itemCount: state.summary.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.summary[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SummaryCard(label: item.label, value: item.value),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
