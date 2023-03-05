import 'package:flutter/material.dart';
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
          Card(
            color: Colors.red,
            child: Text("List of transactions"),
          ),
        ],
      ),
    );
  }
}
