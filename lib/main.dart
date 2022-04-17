import 'package:expense_tracker/widgets/newTransaction.dart';

import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/newTransaction.dart';
import './widgets/transactionListWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.pinkAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 18),
        ),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans',fontSize: 20)))
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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

  void _startModelForNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {}, 
              child: NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque,
              );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker' ), actions: <Widget>[
        IconButton(
            onPressed: () => _startModelForNewTransaction(context),
            icon: Icon(Icons.add))
      ]),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionListWidget(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startModelForNewTransaction(context),
      ),
    );
  }
}
