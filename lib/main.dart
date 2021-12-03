import 'package:calculator_apps/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalApp());
}

class CalApp extends StatelessWidget {
  const CalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculatorApp(),
    );
  }
}
