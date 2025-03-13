import 'package:base_project/src/core/localization/language.dart';
import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:base_project/src/core/utils/converter_helper.dart';
import 'package:base_project/src/core/widgets/app_text/app_text_default.dart';
import 'package:base_project/src/modules/payments/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/widgets.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
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
          final schedules = state.paymentsScheduled;

          if (schedules.isEmpty) {
            return Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.center,
              child: appTextDefault(
                Language.of.scheduleEmptyDescription,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: AppTheme.of.textDescriptionColor,
              ),
            );
          }
          return ListView.builder(
            itemCount: schedules.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = schedules[index];
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
                    Expanded(child: appTextDefault(item.paymentDateFormatted)),
                    Expanded(child: AppAmountText(value: item.total)),
                  ],
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
