import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import 'payments_transactions_event.dart';
import 'payments_transactions_state.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final GetPaymentsUseCase getPaymentsUseCase;

  PaymentsBloc(this.getPaymentsUseCase) : super(PaymentsInitial()) {
    on<FetchPaymentsInfo>(_onFetchPaymentsInfo);
    on<UpdateScheduledPayments>(_onUpdateScheduledPayments);
    on<UpdateTransactions>(_onUpdateTransactions);
    on<UpdateSummary>(_onUpdateSummary);
    on<UpdateTransactionFilter>(_onUpdateTransactionFilter);
    on<UpdateSelectedTransactionFilterLabels>(
      _onUpdateSelectedTransactionFilterLabels,
    );
  }

  Future<void> _onFetchPaymentsInfo(
    FetchPaymentsInfo event,
    Emitter<PaymentsState> emit,
  ) async {
    emit(PaymentsLoading());

    final result = await getPaymentsUseCase();
    result.fold(
      (failure) => emit(PaymentsError(_mapFailureToMessage(failure))),
      (paymentsInfo) => emit(
        PaymentsLoaded(
          paymentsScheduled: paymentsInfo.paymentsScheduled,
          summary: paymentsInfo.summary,
          transactionFilter: paymentsInfo.transactionFilter,
          transactions: paymentsInfo.transactions,
          selectedTransactionFilterLabels:
              paymentsInfo.transactionFilter
                  .where((element) => element.isDefault)
                  .map((e) => e.label)
                  .toList(),
        ),
      ),
    );
  }

  void _onUpdateScheduledPayments(
    UpdateScheduledPayments event,
    Emitter<PaymentsState> emit,
  ) {
    if (state is PaymentsLoaded) {
      final currentState = state as PaymentsLoaded;
      emit(
        PaymentsLoaded(
          paymentsScheduled: event.paymentsScheduled,
          summary: currentState.summary,
          transactionFilter: currentState.transactionFilter,
          transactions: currentState.transactions,
        ),
      );
    }
  }

  void _onUpdateTransactions(
    UpdateTransactions event,
    Emitter<PaymentsState> emit,
  ) {
    if (state is PaymentsLoaded) {
      final currentState = state as PaymentsLoaded;
      emit(
        PaymentsLoaded(
          paymentsScheduled: currentState.paymentsScheduled,
          summary: currentState.summary,
          transactionFilter: currentState.transactionFilter,
          transactions: event.transactions,
        ),
      );
    }
  }

  void _onUpdateSummary(UpdateSummary event, Emitter<PaymentsState> emit) {
    if (state is PaymentsLoaded) {
      final currentState = state as PaymentsLoaded;
      emit(
        PaymentsLoaded(
          paymentsScheduled: currentState.paymentsScheduled,
          summary: event.summary,
          transactionFilter: currentState.transactionFilter,
          transactions: currentState.transactions,
        ),
      );
    }
  }

  void _onUpdateTransactionFilter(
    UpdateTransactionFilter event,
    Emitter<PaymentsState> emit,
  ) {
    if (state is PaymentsLoaded) {
      final currentState = state as PaymentsLoaded;
      emit(
        PaymentsLoaded(
          paymentsScheduled: currentState.paymentsScheduled,
          summary: currentState.summary,
          transactionFilter: event.transactionFilter,
          transactions: currentState.transactions,
        ),
      );
    }
  }

  void _onUpdateSelectedTransactionFilterLabels(
    UpdateSelectedTransactionFilterLabels event,
    Emitter<PaymentsState> emit,
  ) {
    if (state is PaymentsLoaded) {
      final currentState = state as PaymentsLoaded;
      emit(
        PaymentsLoaded(
          paymentsScheduled: currentState.paymentsScheduled,
          summary: currentState.summary,
          transactionFilter: currentState.transactionFilter,
          transactions: currentState.transactions,
          selectedTransactionFilterLabels:
              event.selectedTransactionFilterLabels,
        ),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    return "PaymentsBloc Error: ${failure.message}";
  }
}
