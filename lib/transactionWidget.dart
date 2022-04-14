import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "./transaction.dart";

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;
  
  TransactionWidget(this.transaction);
  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMM yyyy').format(transaction.transactionDate);
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Text('\$ ${transaction.transactionAmount}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              )),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purple, width: 2),
          ),
          padding: EdgeInsets.all(10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(transaction.transactionTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                )),
            Text(
              '${formattedDate}',
              style: TextStyle(color: Colors.grey))
          ],
        )
      ],
    );
  }
}
