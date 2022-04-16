import "package:flutter/foundation.dart";

class Transaction {
  String transactionId;
  String transactionTitle;
  double transactionAmount;
  DateTime transactionDate;
  Transaction(
      {@required this.transactionId,
      @required this.transactionTitle,
      @required this.transactionAmount,
      @required this.transactionDate});
}
