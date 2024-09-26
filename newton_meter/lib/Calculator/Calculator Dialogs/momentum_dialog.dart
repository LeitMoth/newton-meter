import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

typedef MomentumCallback = Function(Vector3 momentumFinal);

class MomentumDialog extends StatefulWidget {
  const MomentumDialog({
    super.key,
  });

  //final MomentumCallback onCalculationsComplete;

  @override
  State<MomentumDialog> createState() => _MomentumDialogState();
}

class _MomentumDialogState extends State<MomentumDialog> {
  Vector3 velocity = Vector3.zero();
  double mass = 0;
  Vector3 momentum = Vector3.zero();


  void _calculateMomentum() {
    setState(() {
      momentum = velocity * mass;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle calcStyle = ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Theme.of(context).colorScheme.inversePrimary);
    ButtonStyle cancelStyle = ElevatedButton.styleFrom( textStyle: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
    backgroundColor: Theme.of(context).colorScheme.tertiaryFixed);
    return AlertDialog(
      title: const Text('Momentum in Vector Form'),
      content:
        Column(
          children: <Widget>[
            TextField( // Velocity X Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Vx ='),
              onChanged: (value) {
                setState(() {
                  velocity.x = double.parse(value);
                });
              }
            ),
            TextField( // Velocity Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Vy ='),
              onChanged: (value) {
                setState(() {
                  velocity.y = double.parse(value);
                });
              }
            ),
            TextField( // Velocity z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Vz ='),
              onChanged: (value) {
                setState(() {
                  velocity.z = double.parse(value);
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
            Text('Momentum = $momentum'),
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
