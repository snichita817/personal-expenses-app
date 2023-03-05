import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function actionHandler;
  AddTransaction({required this.actionHandler});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  // String titleInput = "";
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void submit() {
    final enteredTitle = titleInput.text;
    final eneteredAmount = double.parse(amountInput.text);

    if(enteredTitle.isEmpty || eneteredAmount.isNegative) {
      return;
    }

    widget.actionHandler(
      titleInput.text, 
      double.parse(amountInput.text)
    ,);
    Navigator.of(context).pop();                                // close the top most screen that is displaed
  }

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

              // with () because we are giving reference to (_) function
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount spent'),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            ElevatedButton(
              onPressed: () {
                submit();
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
