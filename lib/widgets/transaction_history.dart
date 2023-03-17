import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_card.dart';
import 'package:intl/intl.dart';

class TransactionHisotry extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteHandler;
  final Function editHandler;
  TransactionHisotry(this.transactions, this.deleteHandler, this.editHandler);

  final dayMonthFormat = DateFormat('d MMM');

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Dismissible(
                  key: UniqueKey(),
                  // key: ValueKey(transaction.id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    transaction.isDismissed = true;
                    deleteHandler(transaction.id, index);
                  },
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: transaction.isDismissed ? Container(height: 0,) : 
                  GestureDetector(
                    onTap: () {
                      editHandler(context, transaction);
                    },
                    child: TransactionCard(transaction: transaction, dayMonthFormat: dayMonthFormat),
                  ),
                );
              },
              itemCount: transactions.length,
            )
          : LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.70,
                    child: Image.asset(
                      'assets/images/nothing.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "No transactions found",
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              );
          }
        );
  }
}