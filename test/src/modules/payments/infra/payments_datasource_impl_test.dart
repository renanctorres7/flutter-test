import 'package:base_project/src/core/base/base.dart';
import 'package:base_project/src/modules/payments/data/model/payments/payments_info_model.dart';
import 'package:base_project/src/modules/payments/domain/domain.dart';
import 'package:base_project/src/modules/payments/infra/datasource/datasource.dart';
import 'package:base_project/src/modules/payments/infra/mock/mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPaymentsDatasource extends Mock implements PaymentsDatasourceImpl {}

class MockInfraError extends Mock implements InfraError {}

void main() {
  late MockPaymentsDatasource mockDatasource;
  final infraError = MockInfraError();

  setUp(() {
    mockDatasource = MockPaymentsDatasource();
  });

  group('PaymentsDatasourceImpl test', () {
    test(
      'Should return a PaymentsInfoEntity when the call to the datasource is successful',
      () async {
        final expectedEntity = PaymentsInfoModel.fromJson(mockPaymentsJson);
        when(
          () => mockDatasource.getPaymentsInfo(),
        ).thenAnswer((_) async => expectedEntity);

        final result = await mockDatasource.getPaymentsInfo();

        expect(result, isA<PaymentsInfoEntity>());
        expect(result, expectedEntity);

        verify(() => mockDatasource.getPaymentsInfo()).called(1);
      },
    );

    test(
      'Should return a InfraError when the call to the datasource has failed',
      () async {
        when(() => mockDatasource.getPaymentsInfo()).thenThrow(infraError);

        expect(
          () async => mockDatasource.getPaymentsInfo(),
          throwsA(isA<InfraError>()),
        );

        verify(() => mockDatasource.getPaymentsInfo()).called(1);
      },
    );
  });
}
