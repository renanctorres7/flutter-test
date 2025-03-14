import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/payments/data/data.dart';
import 'modules/payments/domain/domain.dart';
import 'modules/payments/infra/datasource/datasource.dart';
import 'modules/payments/presentation/bloc/bloc.dart';
import 'modules/payments/presentation/page/payments_transactions_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule and Transactions',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PaymentsRepository>(
            create: (_) => PaymentsRepositoryImpl(PaymentsDatasourceImpl()),
          ),
        ],

        child: BlocProvider(
          create:
              (context) => PaymentsBloc(
                GetPaymentsUseCase(context.read<PaymentsRepository>()),
              )..add(FetchPaymentsInfo()),
          child: const PaymentsTransactionsPage(),
        ),
      ),
    );
  }
}
