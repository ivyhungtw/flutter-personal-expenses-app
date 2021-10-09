// blueprint for a normal dart object
// not as a widget

import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.amount, 
    @required this.date
    });
}