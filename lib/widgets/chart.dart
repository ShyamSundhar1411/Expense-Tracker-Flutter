import "package:flutter/material.dart";
import "package:intl/intl.dart";
import '../models/transaction.dart';
import '../functions/amountRetriver.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;
  ChartWidget(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalAmountfortheDay =
          amountRetrivingFunction(recentTransactions, weekDay);
      print(DateFormat.E().format(weekDay));
      print(totalAmountfortheDay);
      return {
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalAmountfortheDay
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupedTransactionValues.map(
          (data) {
            return Text('${data['day']}');
          }
        ).toList(),
      ),
    );
  }
}
