import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class PosUpdateDialog extends StatefulWidget {
  const PosUpdateDialog({
    super.key,
  });

  @override
  State<PosUpdateDialog> createState() => _PosUpdateDialogState();
}

class _PosUpdateDialogState extends State<PosUpdateDialog> {
  Vector3 vector = Vector3.zero();
  double magnitude = 0;

  Vector3 rf = Vector3.zero();
  Vector3 ri = Vector3.zero();
  Vector3 vavg = Vector3.zero();
  double dt = 0;


  void _calculateMomentum() {
    setState(() {
      rf = ri + (vavg*dt);
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
      title: const Text('Magnitude of any Vector'),
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
            TextField( // Velocity x Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Velo avg x ='),
              onChanged: (value) {
                setState(() {
                  vavg.x = double.parse(value);
                });
              }
            ),
            TextField( // Velocity Y Input Field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Velo avg Y ='),
              onChanged: (value) {
                setState(() {
                  vavg.y = double.parse(value);
                });
              }
            ),
            TextField( // Velocity z Input
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Velo avg Z ='),
              onChanged: (value) {
                setState(() {
                  vavg.z = double.parse(value);
                });
              }
            ),
            TextField( // Time Input
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
            Text('Final Position = $rf'),
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
