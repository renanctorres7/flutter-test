import 'package:base_project/src/modules/payments/domain/domain.dart';

class PaymentsInfoEntityFake extends PaymentsInfoEntity {
  PaymentsInfoEntityFake()
    : super(
        paymentsScheduled: [],
        summary: [],
        transactionFilter: [],
        transactions: [],
      );
}
