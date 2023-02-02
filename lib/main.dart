import 'package:number_magnifier/number_magnifier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Number Magnifier')),
        body: Column(
          children: [
            Row(
              children: const [
                NumberMagnifier(
                  text: '\$ 90',
                  decimalPoint: 2,
                  matchTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                  otherTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                NumberMagnifier(
                  text: '90 Gb',
                  decimalPoint: 0,
                  regex: r'\d+|\D+',
                  matchTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                  otherTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
