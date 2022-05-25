import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import './models/transaction.dart';
import './widgets/newTransaction.dart';
import './widgets/transactionListWidget.dart';
import './widgets/chart.dart';

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
            primarySwatch: Colors.orange,
            accentColor: Colors.orangeAccent,
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
  bool showChart = false;
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    
    final PreferredSizeWidget appbar = Platform.isIOS ? CupertinoNavigationBar(
      middle:Text('Expense Maneger'),
      trailing:Row(
        mainAxisSize: MainAxisSize.min,
        children:<Widget>[
        GestureDetector(onTap:() => _startModelForNewTransaction(context),
        child: Icon(CupertinoIcons.add)
        )
      ]), 
    ): AppBar(title: Text('Expense Maneger'), actions: <Widget>[
      IconButton(
          onPressed: () => _startModelForNewTransaction(context),
          icon: Icon(Icons.add))
    ]);
    final txListWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionListWidget(_transactions, _deleteTransaction));
    final pageBody = SafeArea(child:SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            if (isLandscape)
              (Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Show Chart',style: Theme.of(context).textTheme.titleMedium),
                    Switch.adaptive(
                        value: showChart,
                        onChanged: (val) {
                          setState(() {
                            showChart = val;
                          });
                        }),
                  ])),
            if (!isLandscape)
              (Container(
                  height: (MediaQuery.of(context).size.height -
                          appbar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: ChartWidget(_recentTransactions))),
            if (!isLandscape) txListWidget,
            Container(
                width: double.infinity,
                child: showChart
                    ? Container(
                        height: (MediaQuery.of(context).size.height -
                                appbar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.6,
                        child: ChartWidget(_recentTransactions))
                    : txListWidget)
          ],
        ),
      ));
    return Platform.isIOS?CupertinoPageScaffold(
      child: pageBody,
    ): Scaffold(
      appBar: appbar,
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Platform.isIOS ?Container() : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startModelForNewTransaction(context),
      ),
    );
  }
}
