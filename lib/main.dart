import 'package:expense_tracker/widgets/chart.dart';
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
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                button: TextStyle(color: Colors.white)),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    headline6:
                        TextStyle(fontFamily: 'OpenSans', fontSize: 20)))));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final List<Transaction> _transactions = [];
  List<Transaction> get _recentTransactions {
    return _transactions.where(
      (tx) {
        return tx.transactionDate
            .isAfter(DateTime.now().subtract(Duration(days: 7)));
      },
    ).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        transactionTitle: title,
        transactionAmount: amount,
        transactionDate: chosenDate,
        transactionId: DateTime.now().toString());
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        if (element.transactionId == id) {
          return true;
        } else {
          return false;
        }
      });
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
      appBar: AppBar(title: Text('Expense Tracker'), actions: <Widget>[
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
                child: ChartWidget(_recentTransactions)),
            TransactionListWidget(_transactions, _deleteTransaction),
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
