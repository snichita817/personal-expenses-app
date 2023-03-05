import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function actionHandler;
  // String titleInput = "";
  // String amountInput = "";

  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

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
              controller: titleInput,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount spent'),
              controller: amountInput,
            ),
            ElevatedButton(
              onPressed: () {
                actionHandler(titleInput.text, double.parse(amountInput.text));
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
