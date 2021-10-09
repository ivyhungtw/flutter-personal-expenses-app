import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;

  TransactionCard(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal:  5),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('\$${transaction.amount}')
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date)
          ),
          trailing: IconButton(
            onPressed: () => deleteTx(transaction.id), 
            icon: Icon(Icons.delete), 
            color: Theme.of(context).errorColor
          ),
      ),
    );
  }
}