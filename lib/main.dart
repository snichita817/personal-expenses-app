import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  final dayMonthFormat = DateFormat('d MMM');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("CHART PLACEHOLDER"),
            ),
          ),
          Column(
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
                            width: 80,
                            child: Text(
                              "-" + ts.amountSpent.toString() + " lei",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromRGBO(255, 69, 69, 1),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: 80,
                            child: Text(
                              dayMonthFormat.format(ts.dateOfTransaction),
                              style: const TextStyle(color: Colors.blueGrey),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
