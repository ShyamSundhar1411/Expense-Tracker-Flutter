import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expense Tracker', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Expense Tracker')),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Container(
                    width: double.infinity, child: Text("Chart Goes Here")),
                elevation: 5,
              ),
            ),
            UserTransaction(),
          ],
        ));
  }
}
