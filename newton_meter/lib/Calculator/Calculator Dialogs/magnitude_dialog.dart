import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class MagnitudeDialog extends StatefulWidget {
  const MagnitudeDialog({
    super.key,
  });

  @override
  State<MagnitudeDialog> createState() => _MagnitudeDialogState();
}

class _MagnitudeDialogState extends State<MagnitudeDialog> {
  Vector3 vector = Vector3.zero();
  double magnitude = 0;


  void _calculateMomentum() {
    setState(() {
      magnitude = vector.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle calcStyle = ElevatedButton.styleFrom( textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Theme.of(context).colorScheme.inversePrimary);
    ButtonStyle cancelStyle = ElevatedButton.styleFrom( textStyle: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary),
    backgroundColor: Theme.of(context).colorScheme.tertiaryFixed);
    return AlertDialog(
      title: const Text('Magnitude of any Vector'),
      content:
        Column(
          children: <Widget>[
            TextField( // Vector X Input Field
              keyboardType: TextInputType.number,
              key: Key('vx'),
              decoration: const InputDecoration(labelText: 'Vector X ='),
              onChanged: (value) {
                setState(() {
                  vector.x = double.parse(value);
                });
              }
            ),
            TextField( // Vector Y Input Field
              keyboardType: TextInputType.number,
              key: Key('vy'),
              decoration: const InputDecoration(labelText: 'Vector Y ='),
              onChanged: (value) {
                setState(() {
                  vector.y = double.parse(value);
                });
              }
            ),
            TextField( // Vector z Input
              keyboardType: TextInputType.number,
              key: Key('vz'),
              decoration: const InputDecoration(labelText: 'Vector Z ='),
              onChanged: (value) {
                setState(() {
                  vector.z = double.parse(value);
                });
              }
            ),
            ElevatedButton(
              onPressed: _calculateMomentum,
              style: calcStyle,
              key: const Key('calc'),
              child: const Text('Calculate'),
            ),
            Text('Magnitude = $magnitude', key: const Key('sol')),
          ]
        ),

        actions: <Widget> [
          ElevatedButton(
            style: cancelStyle,
            key: const Key('canc'),
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
