// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:expense_tracker/widgets/transactionDataDisplayWidget.dart';
import "package:flutter/material.dart";
import '../models/transaction.dart';
import './transactionDataDisplayWidget.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionListWidget(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:300,
      child: ListView.builder(
        itemBuilder: (tx,index){
           return Card(
            child:TransactionDataDisplayWidget(userTransactions[index])
            );
          },
        itemCount: userTransactions.length,

      )
    );
  }
}
