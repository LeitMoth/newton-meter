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
  Vector3 velocity = new Vector3.zero();

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
          ]
        )
    );
  }
}
