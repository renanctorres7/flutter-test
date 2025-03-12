import 'package:base_project/src/core/localization/language.dart';

class LanguageEnglish implements Language {
  @override
  String get payments => 'Payments';

  @override
  String get schedule => 'Schedule';

  @override
  String get scheduleEmptyDescription =>
      'Once your loan is booked your payment schedule will appear here. This process may take 1-2 business days.';

  @override
  String get transactions => 'Transactions';

  @override
  String get transactionsEmptyDescription =>
      'Once you begin your payments they will appear here. This process may take 1-2 business days.';

  @override
  String get paymentQuestion => 'Do you want to make a payment?';

  @override
  String get clickHere => 'Click here';

  @override
  String get additionalInformation => 'Additional Information';

  @override
  String get processDate => 'Process Date';

  @override
  String get amount => 'Amount';

  @override
  String get type => 'Type';

  @override
  String get principal => 'Principal';

  @override
  String get interest => 'Interest';

  @override
  String get lateFee => 'Late Fee';

  @override
  String get postDate => 'Post Date';

  @override
  String get principalBalance => 'Principal Balance';

  @override
  String get outstandingBalance => 'Outstanding Balance';

  @override
  String get totalPaid => 'Total Paid';

  @override
  String get principalPaid => 'Principal Paid';

  @override
  String get interestPaid => 'Interest Paid';
}
