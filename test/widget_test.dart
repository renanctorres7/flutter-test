import 'package:base_project/src/modules/payments/presentation/bloc/bloc.dart';
import 'package:base_project/src/modules/payments/presentation/page/payments.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPaymentsBloc extends MockBloc<PaymentsEvent, PaymentsState>
    implements PaymentsBloc {}

class MockPaymentsStateFake extends Fake implements PaymentsState {}

class MockPaymentsEventFake extends Fake implements PaymentsEvent {}

void main() {
  setUp(() {
    registerFallbackValue(MockPaymentsStateFake());
    registerFallbackValue(MockPaymentsEventFake());
  });

  testWidgets('Should render PaymentsTransactionsPage', (tester) async {
    final mockPaymentsBloc = MockPaymentsBloc();

    when(() => mockPaymentsBloc.state).thenReturn(PaymentsInitial());
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<PaymentsBloc>.value(
          value: mockPaymentsBloc,
          child: PaymentsTransactionsPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(SummaryList), findsOneWidget);
    expect(find.byType(MakePaymentButton), findsOneWidget);
    expect(find.byType(ScheduleTransactionsTabBar), findsOneWidget);
    expect(find.byType(ScheduleList), findsOneWidget);
  });
}
