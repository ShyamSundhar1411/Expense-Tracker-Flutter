import "package:flutter/material.dart";

double amountRetrivingFunction(transactions, timestamp) {
  var totalSum = 0.0;
  for (var i = 0; i < transactions.length; i++) {
    if (transactions[i].transactionDate.day == timestamp.day &&
        transactions[i].transactionDate.month == timestamp.month &&
        transactions[i].transactionDate.year == timestamp.year) {
      totalSum += transactions[i].transactionAmount;
    }
  }
  return totalSum;
}
