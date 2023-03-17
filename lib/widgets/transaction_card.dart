import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.dayMonthFormat,
  });

  final Transaction transaction;
  final DateFormat dayMonthFormat;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Text(
              transaction.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 85,
                  child: FittedBox(
                    child: Text(
                      "-${transaction.amountSpent.toStringAsFixed(2)} lei",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromRGBO(255, 69, 69, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: 85,
                  child: Text(
                    dayMonthFormat.format(transaction.dateOfTransaction),
                    style: const TextStyle(
                        color: Color.fromRGBO(129, 129, 129, 1)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
