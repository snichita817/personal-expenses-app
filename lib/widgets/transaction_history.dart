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
    return Container(
      height: 500,
      child: transactions.isNotEmpty ? ListView.builder(
        itemBuilder: (context, index) {
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
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.black,
                  //     width: 2,
                  //   ),
                  // ),     *Use for border
                  // padding: EdgeInsets.all(10),
                  child: Text(
                    transactions[index].title,
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
                          "-${transactions[index].amountSpent.toStringAsFixed(2)} lei",
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
                          dayMonthFormat.format(transactions[index].dateOfTransaction),
                          style: const TextStyle(color: Color.fromRGBO(129, 129, 129, 1)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ); 
        },
        itemCount: transactions.length,
      )
      : Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Image.asset(
             'assets/images/nothing.png',
             fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "No transactions found",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      )
    );
  }
}
