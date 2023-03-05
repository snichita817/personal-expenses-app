import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function actionHandler;
  String titleInput = "N/A";
  String amountInput = "0";
  AddTransaction({required this.actionHandler});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'What did you spend on?'),
              onChanged: (value) {
                titleInput = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount spent'),
              onChanged: (value) {
                amountInput = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                actionHandler(titleInput, double.parse(amountInput));
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
