import 'package:equatable/equatable.dart';

import '../../domain/entity/entity.dart';

abstract class PaymentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentsInitial extends PaymentsState {}

class PaymentsLoading extends PaymentsState {}

class PaymentsLoaded extends PaymentsState {
  final List<PaymentsScheduledEntity> paymentsScheduled;
  final List<PaymentsSummaryEntity> summary;
  final List<PaymentsTransactionFilterEntity> transactionFilter;
  final List<PaymentsTransactionsEntity> transactions;
  final List<String> selectedTransactionFilterLabels;
  PaymentsLoaded({
    required this.paymentsScheduled,
    required this.summary,
    required this.transactionFilter,
    required this.transactions,
    this.selectedTransactionFilterLabels = const [],
  });

  @override
  List<Object?> get props => [
    paymentsScheduled,
    summary,
    transactionFilter,
    transactions,
    selectedTransactionFilterLabels,
  ];
}

class PaymentsError extends PaymentsState {
  final String message;
  PaymentsError(this.message);

  @override
  List<Object?> get props => [message];
}
