import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

typedef MomentumCallback = Function(Vector3 momentumFinal);

class ForceDialog extends StatefulWidget {
  const ForceDialog({
    super.key,
  });

  //final MomentumCallback onCalculationsComplete;

  @override
  State<ForceDialog> createState() => _ForceDialogState();
}

class _ForceDialogState extends State<ForceDialog> {
  Vector3 acceleration = Vector3.zero();
  double mass = 0;
  Vector3 force = Vector3.zero();


  void _calculateMomentum() {
    setState(() {
      force = acceleration * mass;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle calcStyle = ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Theme.of(context).colorScheme.inversePrimary);
    ButtonStyle cancelStyle = ElevatedButton.styleFrom( textStyle: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
    backgroundColor: Theme.of(context).colorScheme.tertiaryFixed);
    return AlertDialog(
      title: const Text('Force in Vector Form'),
      content:
        Column(
          children: <Widget>[
            TextField( // Acceleration X Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Accel x ='),
              onChanged: (value) {
                setState(() {
                  acceleration.x = double.parse(value);
                });
              }
            ),
            TextField( // Acceleration Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Accel y ='),
              onChanged: (value) {
                setState(() {
                  acceleration.y = double.parse(value);
                });
              }
            ),
            TextField( // Acceleration z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Accel z ='),
              onChanged: (value) {
                setState(() {
                  acceleration.z = double.parse(value);
                });
              }
            ),
            TextField( // Mass Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Mass ='),
              onChanged: (value) {
                setState(() {
                  mass = double.parse(value);
                });
              }
            ),
            ElevatedButton(
              onPressed: _calculateMomentum,
              style: calcStyle,
              child: const Text('Calculate'),
            ),
            Text('Force = $force'),
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
