import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_card.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty 
      ? Column(
        children: <Widget>[
          Text(
            'No transactiona added yet!',
            style: Theme.of(context).textTheme.headline6
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)
          )
        ],
      ) 
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionCard(transactions[index], deleteTx);
        },
        itemCount: transactions.length,
      ),
    );
  }
}