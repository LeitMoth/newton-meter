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
        decoration:
            const InputDecoration(labelText: 'Mass (kg)', hintText: "1.0"),
        keyboardType: TextInputType.number,
        onChanged: (text) {
          setState(() {
            mass = double.parse(text);
          });
        },
      ),
      Text('Mass = ${mass}kg'),
      Text('Time = ${widget.results.elapsed}s'),
      Text('Average Velocity = ${widget.results.averageVelocity}m/s'),
      Text('Average Momentum = ${widget.results.averageMomentum(mass)}kg m/s'),
      Text('Net Force = ${widget.results.netForce(mass)}N'),
      Text('Displacement = ${widget.results.displacement}m'),
    ]));
  }
}
