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
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Text('\$ ${transaction.transactionAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              )),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          padding: EdgeInsets.all(10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(transaction.transactionTitle,
                style: Theme.of(context).textTheme.headline6),
            Text('${formattedDate}', style: TextStyle(color: Colors.grey))
          ],
        )
      ],
    );
  }
}
