import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionHisotry extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionHisotry(this.transactions);

  final dayMonthFormat = DateFormat('d MMM');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((ts) {
        return Card(
          color: Color.fromRGBO(30, 28, 28, 1),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black,
                //     width: 2,
                //   ),
                // ),     *Use for border
                // padding: EdgeInsets.all(10),
                child: Text(
                  ts.title,
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
                      child: Text(
                        "-${ts.amountSpent.toString()} lei",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromRGBO(255, 69, 69, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: 85,
                      child: Text(
                        dayMonthFormat.format(ts.dateOfTransaction),
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}