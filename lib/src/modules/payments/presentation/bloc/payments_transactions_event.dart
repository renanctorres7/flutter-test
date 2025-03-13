import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

abstract class PaymentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPaymentsInfo extends PaymentsEvent {}

class UpdateScheduledPayments extends PaymentsEvent {
  final List<PaymentsScheduledEntity> paymentsScheduled;
  UpdateScheduledPayments(this.paymentsScheduled);

  @override
  List<Object> get props => [paymentsScheduled];
}

class UpdateTransactions extends PaymentsEvent {
  final List<PaymentsTransactionsEntity> transactions;
  UpdateTransactions(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class UpdateSummary extends PaymentsEvent {
  final List<PaymentsSummaryEntity> summary;
  UpdateSummary(this.summary);

  @override
  List<Object> get props => [summary];
}

class UpdateTransactionFilter extends PaymentsEvent {
  final List<PaymentsTransactionFilterEntity> transactionFilter;
  UpdateTransactionFilter(this.transactionFilter);

  @override
  List<Object> get props => [transactionFilter];
}

class UpdateSelectedTransactionFilterLabels extends PaymentsEvent {
  final List<String> selectedTransactionFilterLabels;
  UpdateSelectedTransactionFilterLabels(this.selectedTransactionFilterLabels);

  @override
  List<Object> get props => [selectedTransactionFilterLabels];
}
