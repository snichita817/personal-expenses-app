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
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
      children: <Widget>[
        // contains the spent amount text
        Container(
          height: constraints.maxHeight * 0.15,
          // fitted box to shrink the text of the amount spent
          child: FittedBox(child: Text("${spentAmount.toStringAsFixed(0)} lei"))),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.6,
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
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox(child: Text(label)),),
      ],
    );
    },);
     
  }
}
