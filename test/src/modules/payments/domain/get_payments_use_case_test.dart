import 'package:base_project/src/core/core.dart';
import 'package:base_project/src/modules/payments/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/class/mocks_class.dart';

class MockPaymentRepository extends Mock implements PaymentsRepository {}

void main() {
  late GetPaymentsUseCase usecase;
  late MockPaymentRepository mockRepository;
  final paymentsInfoEntityMock = PaymentsInfoEntityFake();

  setUp(() {
    mockRepository = MockPaymentRepository();
    usecase = GetPaymentsUseCase(mockRepository);
  });

  group('GetPaymentsUseCase test', () {
    test(
      'Should return a PaymentsInfoEntity when the call to the repository is successful',
      () async {
        when(
          () => mockRepository.getPayments(),
        ).thenAnswer((_) async => Right(paymentsInfoEntityMock));

        final result = await usecase();

        expect(result, Right(paymentsInfoEntityMock));

        verify(() => mockRepository.getPayments()).called(1);
      },
    );

    test(
      'Should return a Failure when the call to the repository has failed',
      () async {
        when(
          () => mockRepository.getPayments(),
        ).thenAnswer((_) async => Left(GenericFailure()));

        final result = await usecase();

        expect(result, isA<Left>());

        verify(() => mockRepository.getPayments()).called(1);
      },
    );
  });
}
