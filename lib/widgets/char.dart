import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
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

      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) => sum + item['amount'] );
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Container(
      child: Card(
        elevation: 6, //shadow
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight, // force every child takes the same width
                child: ChartBar(
                  data['day'], 
                  data['amount'], 
                  totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending
                ),
              );
            }).toList(),
          ),
        )
      ),
    );
  }
}