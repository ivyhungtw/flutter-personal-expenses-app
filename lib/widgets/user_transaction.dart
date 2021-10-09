import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({ Key key }) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'New Shoes', amount: 39.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Grocery', amount: 150.99, date: DateTime.now())
  ];

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

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // pass function pointer to new_transaction
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ]
    );
  }
}