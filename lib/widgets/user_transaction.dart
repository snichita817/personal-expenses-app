// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import './add_transaction.dart';
// import './transaction_history.dart';
// import '../models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   State<UserTransactions> createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   // final means i cant change the pointer to the transactions
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 'transc1',
//       title: 'Food',
//       amountSpent: 41.59,
//       dateOfTransaction: DateTime.now(),
//     ),
//     Transaction(
//       id: 'transc2',
//       title: 'Flowers',
//       amountSpent: 23.49,
//       dateOfTransaction: DateTime.now(),
//     ),
//   ];

//   void _addTransaction(String titleInput, double amountInput) {
//     final newTransaction = Transaction(
//       id: DateTime.now().toString(), 
//       title: titleInput, 
//       amountSpent: amountInput, 
//       dateOfTransaction: DateTime.now()
//     );

//     setState(() {
//       _userTransactions.add(newTransaction);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//           //! Input Widget
//           AddTransaction(actionHandler: _addTransaction,),
//           //! Transaction list
//           TransactionHisotry(_userTransactions),],
//     );
//   }
// }