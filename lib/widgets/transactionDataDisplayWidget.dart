import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "../models/transaction.dart";

class TransactionDataDisplayWidget extends StatelessWidget {
  final Transaction transaction;
  TransactionDataDisplayWidget(this.transaction);
  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        DateFormat('dd MMM yyyy').format(transaction.transactionDate);
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child : Padding(
          padding: EdgeInsets.all(10),
          child: FittedBox(
            child: Text("\$${transaction.transactionAmount}"),
          ),
        )
      ),
      title: Text("${transaction.transactionTitle}",
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text("${formattedDate}"), 
    );
  }
}
