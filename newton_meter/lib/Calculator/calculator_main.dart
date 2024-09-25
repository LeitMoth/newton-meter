
import 'package:flutter/material.dart';

class CalculatorMain extends StatefulWidget {
  const CalculatorMain({super.key});

  @override
  State createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {

  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator')
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: <Widget> [
          ElevatedButton(
            onPressed: null,
            style: style,
            child: const Text('Gravitational Force (Vector)'),
          ),
          ElevatedButton(
            onPressed: null,
            style: style,
            child: const Text('Momentum (Vector)'),
          ),
          ElevatedButton(
            onPressed: null,
            style: style,
            child: const Text('Magnitude (Any Vector)'),
          ),
          ElevatedButton(
            onPressed: null,
            style: style,
            child: const Text('Position Update (Vector)'),
          ),
          // Add More Buttons for other formulas
        ]
      )
    );
  }
}