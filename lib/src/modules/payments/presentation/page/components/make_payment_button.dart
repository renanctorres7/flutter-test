import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/language.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../bloc/bloc.dart';

class MakePaymentButton extends StatelessWidget {
  const MakePaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsBloc, PaymentsState>(
      builder: (_, state) {
        if (state is PaymentsLoading ||
            state is PaymentsInitial ||
            state is PaymentsError) {
          return SizedBox();
        }

        if (state is PaymentsLoaded) {
          return Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                appTextDefault(
                  Language.of.paymentQuestion,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.of.textColor,
                ),
                GestureDetector(
                  onTap: () {},
                  child: appTextDefault(
                    Language.of.clickHere,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.of.textLinkColor,
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
