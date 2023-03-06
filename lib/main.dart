import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:personal_expenses/widgets/transaction_history.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      theme: ThemeData(
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        //  bottomSheetTheme: BottomSheetThemeData(backgroundColor: const Color.fromRGBO(22, 22, 24, 1)),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(0, 0, 0, 1),
          secondary: const Color.fromRGBO(22, 22, 24, 1),
          tertiary: const Color.fromRGBO(38, 16, 115, 1),
          // tertiary: const Color.fromRGBO(110, 76, 229, 1),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    // where runs a function on every element of the list
    return _userTransactions.where(
      (transaction) {
        return transaction.dateOfTransaction.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        ); // we return transactions that are younger than 7 days
      },
    ).toList();
  }

  void _addTransaction(
      String titleInput, double amountInput, DateTime chosenDate) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: titleInput,
      amountSpent: amountInput,
      dateOfTransaction: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id, int index) {

    var transaction = _recentTransactions[index];
    // Remove the item from the data source.
    setState(() {           // calling again build method to build graph once again
      _recentTransactions.removeWhere((transaction) => transaction.id == id);
    });

    
    // Show a snackbar to let the user undo the deletion.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Transaction deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            // modifying isDismissed value to show it on the list when undo is pressed
            transaction.isDismissed = false;
            setState(() {
              // Add the item back to the list.
              _recentTransactions.insert(index, transaction);
            });
          },
        ),
      ),
    );
  }

  void _addNewTransactionMenu(BuildContext cnt) {
    showModalBottomSheet(
      context: cnt,
      builder: (builderContext) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior
              .opaque, // prevents taping on the add screen from closing it
          child: AddTransaction(actionHandler: _addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text('My Expenses'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _addNewTransactionMenu(context),
              icon: Icon(Icons.add))
        ],
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
                  child: Chart(recentTransactions: _recentTransactions),
                ),
              ),
              TransactionHisotry(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
      ),
    );
  }
}
