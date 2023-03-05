import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/transaction_history.dart';
import './models/transaction.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'transc1',
      title: 'Food',
      amountSpent: 41.59,
      dateOfTransaction: DateTime.now(),
    ),
    Transaction(
      id: 'transc2',
      title: 'Flowers',
      amountSpent: 23.49,
      dateOfTransaction: DateTime.now(),
    ),
  ];

  void _addTransaction(String titleInput, double amountInput) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(), 
      title: titleInput, 
      amountSpent: amountInput, 
      dateOfTransaction: DateTime.now()
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }
  void _addNewTransactionMenu(BuildContext cnt) {
    showModalBottomSheet(
      context: cnt,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,                           // prevents taping on the add screen from closing it
          child:AddTransaction(actionHandler: _addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[IconButton(onPressed: () => _addNewTransactionMenu(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("CHART PLACEHOLDER"),
                ),
              ),
              TransactionHisotry(_userTransactions),
            ],
          ),
        ),
      ),
    );
  }
}
