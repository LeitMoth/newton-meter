import 'package:flutter/material.dart';
import 'package:newton_meter/math/results.dart';

class ResultsDisplay extends StatefulWidget {
  const ResultsDisplay({required this.results, super.key});
  final NewtonResults results;

  @override
  State<ResultsDisplay> createState() => _ResultsDisplayState();
}

class _ResultsDisplayState extends State<ResultsDisplay> {
  double mass = 1.0;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      TextField(
        decoration: const InputDecoration(labelText: 'Mass (kg)', hintText: "1.0"),
        keyboardType: TextInputType.number,
        onChanged: (text) { 
          setState(() {
            mass = double.parse(text);
          });
        },
      ),

      // Text('Average Velocity = $avgVelo'),
      // Text('Net Force = $netForce'),
      // Text('Average Momentum = $avgMoment'),
      Text('Mass = ${mass}kg'),
      Text('Time = ${widget.results.acceleration.last.seconds.toStringAsPrecision(5)}s'),
      // Text('Position Change = $posChange'),
      // Text('Vector 3 = $vector3'),
      // Text('Vector 4 = $vector4'),
    ]));
  }
}
