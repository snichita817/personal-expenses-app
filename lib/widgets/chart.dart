import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';
import '../models/chartData.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({required this.recentTransactions});

  // List of maps that shows the sum spent on days of the week
  List<ChartData> get groupedTransactionValues {
    return List.generate(7, (index) {
      // generate 1 week of days from today
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );

      double sumForTheDay = 0.0;
      for(var transaction in recentTransactions){
        if (transaction.dateOfTransaction.day == dayOfWeek.day &&
            transaction.dateOfTransaction.month == dayOfWeek.month &&
            transaction.dateOfTransaction.year == dayOfWeek.year) {
          sumForTheDay += transaction.amountSpent;
        }
      }

      //! For debugging
      print(DateFormat.E().format(dayOfWeek));
      print(sumForTheDay);

      // generating the day of the week with the amount spent
      return ChartData(
        dayOfTheWeek: DateFormat.E().format(dayOfWeek),
        spentForTheDay: sumForTheDay,
      );
    }).reversed.toList();
  }

  double get weekSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue += element.spentForTheDay;
    });
  }

  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data.dayOfTheWeek, 
                spentAmount: data.spentForTheDay, 
                spentPercentage: weekSpending == 0.0 ? 0.0 : data.spentForTheDay/weekSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
