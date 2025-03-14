enum FilterTransactionsEnum {
  processDate,
  amount,
  type,
  principal,
  interest,
  lateFee,
  postDate,
  principalBalance,
}

extension FilterTransactionsEnumExtension on FilterTransactionsEnum {
  String get label {
    switch (this) {
      case FilterTransactionsEnum.processDate:
        return 'Process Date';
      case FilterTransactionsEnum.amount:
        return 'Amount';
      case FilterTransactionsEnum.type:
        return 'Type';
      case FilterTransactionsEnum.principal:
        return 'Principal';
      case FilterTransactionsEnum.interest:
        return 'Interest';
      case FilterTransactionsEnum.lateFee:
        return 'Late Fee';
      case FilterTransactionsEnum.postDate:
        return 'Post Date';
      case FilterTransactionsEnum.principalBalance:
        return 'Principal Balance';
    }
  }
}
