import "package:flutter/material.dart";
import 'transactionListWidget.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        transactionId: "1",
        transactionTitle: "New Shoes",
        transactionAmount: 69.99,
        transactionDate: DateTime.now()),
    Transaction(
        transactionId: "2",
        transactionTitle: "Test",
        transactionAmount: 5,
        transactionDate: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        transactionTitle: title,
        transactionAmount: amount,
        transactionDate: DateTime.now(),
        transactionId: DateTime.now().toString());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionWidget(_transactions),
    ]);
  }
}
