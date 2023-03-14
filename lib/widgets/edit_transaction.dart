import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class EditTransaction extends StatefulWidget {
  final Function editHandler;
  final Transaction passedTransaction;
  
  DateTime _selectedDate = DateTime.now();
  TextEditingController _titleInput = TextEditingController();
  TextEditingController _amountInput = TextEditingController();

  EditTransaction({required this.editHandler, required this.passedTransaction}) {
    this._titleInput.text = passedTransaction.title;
    this._selectedDate = passedTransaction.dateOfTransaction;
    this._amountInput.text = passedTransaction.amountSpent.toString();
  }

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {

  void _submit() {
    if(widget._amountInput.text.isEmpty) {
      return;
    }

    final _enteredTitle = widget._titleInput.text;
    final _eneteredAmount = double.parse(widget._amountInput.text);

    if (_enteredTitle.isEmpty || _eneteredAmount.isNegative || widget._selectedDate == null) {
      return;
    }

    final Transaction _newTransaction = Transaction(id: DateTime.now().toString(), title: _enteredTitle, amountSpent: _eneteredAmount, dateOfTransaction: widget._selectedDate);

    widget.editHandler(widget.passedTransaction, _newTransaction);
    Navigator.of(context).pop();
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
        widget._selectedDate = datePicked;
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
                controller: widget._titleInput,
    
                // with () because we are giving reference to (_) function
                onSubmitted: (_) => _submit(),
              ),
    
              //* Amount spent input
              TextField(
                decoration: InputDecoration(labelText: 'Amount spent'),
                controller: widget._amountInput,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submit(),
              ),
    
              //* Date picker
              Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(widget._selectedDate == null ? 'No date chosen!' : "Picked date: ${DateFormat.yMd().format(widget._selectedDate)}")),
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
                child: Text('Edit Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}