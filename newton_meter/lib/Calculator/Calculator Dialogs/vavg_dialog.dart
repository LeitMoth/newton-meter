import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

typedef MomentumCallback = Function(Vector3 momentumFinal);

class AvgVeloDialog extends StatefulWidget {
  const AvgVeloDialog({
    super.key,
  });

  //final MomentumCallback onCalculationsComplete;

  @override
  State<AvgVeloDialog> createState() => _AvgVeloDialogState();
}

class _AvgVeloDialogState extends State<AvgVeloDialog> {
  Vector3 vavg = Vector3.zero();
  Vector3 dr = Vector3.zero();
  Vector3 ri = Vector3.zero();
  Vector3 rf = Vector3.zero();
  double dt = 0;


  void _calculateMomentum() {
    setState(() {
      dr = rf - ri;
      vavg = dr / dt;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle calcStyle = ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Theme.of(context).colorScheme.inversePrimary);
    ButtonStyle cancelStyle = ElevatedButton.styleFrom( textStyle: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
    backgroundColor: Theme.of(context).colorScheme.tertiaryFixed);
    return AlertDialog(
      scrollable: true,
      title: const Text('Momentum in Vector Form'),
      content:
        Column(
          children: <Widget>[
            TextField( // ri X Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ri x ='),
              onChanged: (value) {
                setState(() {
                  ri.x = double.parse(value);
                });
              }
            ),
            TextField( // ri Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ri y ='),
              onChanged: (value) {
                setState(() {
                  ri.y = double.parse(value);
                });
              }
            ),
            TextField( // ri z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ri z ='),
              onChanged: (value) {
                setState(() {
                  ri.z = double.parse(value);
                });
              }
            ),
            TextField( // rf X Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'rf x ='),
              onChanged: (value) {
                setState(() {
                  rf.x = double.parse(value);
                });
              }
            ),
            TextField( // rf Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'rf y ='),
              onChanged: (value) {
                setState(() {
                  rf.y = double.parse(value);
                });
              }
            ),
            TextField( // rf z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'rf z ='),
              onChanged: (value) {
                setState(() {
                  rf.z = double.parse(value);
                });
              }
            ),
            TextField( // dt Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Time ='),
              onChanged: (value) {
                setState(() {
                  dt = double.parse(value);
                });
              }
            ),
            ElevatedButton(
              onPressed: _calculateMomentum,
              style: calcStyle,
              child: const Text('Calculate'),
            ),
            Text('Average Velocity = $vavg'),
          ]
        ),

        actions: <Widget> [
          ElevatedButton(
            style: cancelStyle,
            child: const Text('Close'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }
          )
        ]
    );
  }
}
