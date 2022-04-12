import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        transactionId: "1",
        transactionTitle: "New Shoes",
        transactionAmount: 69.99,
        transactionDate: DateTime.now()),
    Transaction(
      transactionId: "2", 
      transactionTitle: "Test", 
      transactionAmount:5, 
      transactionDate: DateTime.now())

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Expense Tracker')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Card(child: Text("List goes down here")),
          ],
        ));
  }
}
