import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/char.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.amber
        ),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 18)
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans', 
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(id: 't1', title: 'New Shoes', amount: 39.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Grocery', amount: 150.99, date: DateTime.now()),
    // Transaction(id: 't1', title: 'New Shoes', amount: 39.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Grocery', amount: 150.99, date: DateTime.now()),
    // Transaction(id: 't1', title: 'New Shoes', amount: 39.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Grocery', amount: 150.99, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) => tx.date.isAfter(
      DateTime.now().subtract(Duration(days: 7)))
    ).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now(), 
      id: DateTime.now().toString()
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses', style: TextStyle(fontFamily: 'Open Sans'),),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context), 
            icon: Icon(Icons.add)
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
