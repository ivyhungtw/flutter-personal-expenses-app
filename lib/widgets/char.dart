import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day && 
          tx.date.month == weekDay.month &&
          tx.date.year == weekDay.year) {
            totalSum += tx.amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
  });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
      elevation: 6, //shadow
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      )
    );
  }
}