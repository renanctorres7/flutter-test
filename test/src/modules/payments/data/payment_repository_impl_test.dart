import 'package:base_project/src/core/core.dart';
import 'package:base_project/src/modules/payments/data/data.dart';
import 'package:base_project/src/modules/payments/domain/domain.dart';
import 'package:base_project/src/modules/payments/infra/mock/mock.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPaymentsDatasource extends Mock implements PaymentsDataSource {}

class MockGenericFailure extends Mock implements GenericFailure {}

void main() {
  late PaymentsRepositoryImpl repository;
  late MockPaymentsDatasource mockDatasource;
  final genericFailure = MockGenericFailure();

  setUp(() {
    mockDatasource = MockPaymentsDatasource();
    repository = PaymentsRepositoryImpl(mockDatasource);
  });

  group('PaymentsRepositoryImpl test', () {
    test(
      'Should return a PaymentsInfoEntity when the call to the datasource is successful',
      () async {
        final expectedEntity = PaymentsInfoModel.fromJson(mockPaymentsJson);
        when(
          () => mockDatasource.getPaymentsInfo(),
        ).thenAnswer((_) async => expectedEntity);

        final result = await repository.getPayments();

        expect(result, Right(expectedEntity));

        verify(() => mockDatasource.getPaymentsInfo()).called(1);
      },
    );

    test(
      'Should return a GenericFailure when the call to the datasource fails',
      () async {
        when(() => mockDatasource.getPaymentsInfo()).thenThrow(genericFailure);

        expect(
          () async => mockDatasource.getPaymentsInfo(),
          throwsA(isA<GenericFailure>()),
        );

        verify(() => mockDatasource.getPaymentsInfo()).called(1);
      },
    );
  });
}
