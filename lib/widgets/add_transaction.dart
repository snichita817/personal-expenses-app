import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AddTransaction extends StatefulWidget {
  final Function actionHandler;
  AddTransaction({required this.actionHandler});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  // String _titleInput = "";
  final _titleInput = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _amountInput = TextEditingController();

  void _submit() {
    if(_amountInput.text.isEmpty){
      return;
    }
    
    final _enteredTitle = _titleInput.text;
    final _eneteredAmount = double.parse(_amountInput.text);

    if (_enteredTitle.isEmpty || _eneteredAmount.isNegative || _selectedDate == null) {
      return;
    }

    widget.actionHandler(
      _titleInput.text,
      double.parse(_amountInput.text),
      _selectedDate
    );
    Navigator.of(context).pop(); // close the top most screen that is displaed
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((datePicked) {                // this function will wait for user to enter a date
      if(datePicked == null) {
        return null;
      }
      setState(() {
        _selectedDate = datePicked;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // Wrapping in single child scroll view to scroll when keyword shows up and you dont have space to type
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //* Spent on information
              TextField(
                decoration: InputDecoration(labelText: 'What did you spend on?'),
                controller: _titleInput,
    
                // with () because we are giving reference to (_) function
                onSubmitted: (_) => _submit(),
              ),
    
              //* Amount spent input
              TextField(
                decoration: InputDecoration(labelText: 'Amount spent'),
                controller: _amountInput,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submit(),
              ),
    
              //* Date picker
              Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(_selectedDate == null ? 'No date chosen!' : "Picked date: ${DateFormat.yMd().format(_selectedDate)}")),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      onPressed: _presentDatePicker,
                      child: Text('Choose date'),
                    ),
                  ],
                ),
              ),
    
              //* Add transaction button
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
