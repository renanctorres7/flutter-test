import 'package:base_project/src/core/localization/language_english.dart';

abstract class Language {
  static Language get of => LanguageEnglish();
  String get payments;
  String get schedule;
  String get scheduleEmptyDescription;
  String get transactions;
  String get transactionsEmptyDescription;
  String get paymentQuestion;
  String get clickHere;
  String get additionalInformation;
  String get processDate;
  String get amount;
  String get type;
  String get principal;
  String get interest;
  String get lateFee;
  String get postDate;
  String get principalBalance;

  String get outstandingBalance;
  String get totalPaid;
  String get principalPaid;
  String get interestPaid;
  String get somethingWentWrong;
  String get somethingWentWrongDescription;
}
