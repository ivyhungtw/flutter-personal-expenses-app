import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  // accept function pointer passed by user_transaction
  final Function addTx;
  // controller listens to and saves user input automatically
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  // onChanged: (val) => titleInput = val,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  // onChanged: (val) => amountInput = val,
                ),
                TextButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                    color: Colors.purple,
                  ),
                  ), 
                  onPressed: () {
                    addTx(
                      titleController.text, 
                      double.parse(amountController.text)
                    );
                  }, )
              ]
            ),
          );
  }
}