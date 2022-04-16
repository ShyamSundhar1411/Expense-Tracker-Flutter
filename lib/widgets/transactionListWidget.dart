// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:expense_tracker/widgets/transactionDataDisplayWidget.dart';
import "package:flutter/material.dart";
import '../models/transaction.dart';
import './transactionDataDisplayWidget.dart';

class TransactionWidget extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionWidget(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((transaction) {
        return Card(
          child:TransactionDataDisplayWidget(transaction)
          );
      }).toList(),
    );
  }
}
