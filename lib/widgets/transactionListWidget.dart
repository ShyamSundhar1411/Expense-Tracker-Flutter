// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import "package:flutter/material.dart";
import '../models/transaction.dart';
import './transactionDataDisplayWidget.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;
  TransactionListWidget(this.userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text("No Transactions Added Yet!",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 30),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (tx, index) {
              return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: TransactionDataDisplayWidget(
                      userTransactions[index], deleteTx));
            },
            itemCount: userTransactions.length,
          );
  }
}
