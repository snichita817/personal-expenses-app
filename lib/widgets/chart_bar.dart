import 'dart:ffi';

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spentAmount;
  final double spentPercentage;

  ChartBar(
      {required this.label,
      required this.spentAmount,
      required this.spentPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // fitted box to shrink the text of the amount spent
        Container(
          height: 20,
          child: FittedBox(child: Text("${spentAmount.toStringAsFixed(0)} lei"))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            // element at the bottom
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // element of the top of the stack
            FractionallySizedBox(
              heightFactor: spentPercentage,
              // this child(container) will have the color i want for the graph
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
