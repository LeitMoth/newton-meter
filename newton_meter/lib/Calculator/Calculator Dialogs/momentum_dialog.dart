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
  Vector3 momentum = Vector3.zero();
  double mass = 0;

  ButtonStyle calcStyle = ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 20),  backgroundColor: const Color.fromARGB(255, 24, 119, 63), foregroundColor: Color.fromARGB(255, 0, 0, 0));

  void _calculateMomentum() {
    momentum = velocity * mass;
  }

  @override
  Widget build(BuildContext context) {
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

            ElevatedButton(
              onPressed: _calculateMomentum,
              style: calcStyle,
              child: const Text('Calculate'),
            ),
          ]
        )
    );
  }
}
